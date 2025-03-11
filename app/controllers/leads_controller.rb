class LeadsController < ApplicationController
  # Skip CSRF protection for API endpoints if needed
  # skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    @lead = Lead.new(lead_params)
    @lead.ip_address = request.remote_ip
    
    # Capture UTM parameters if present
    utm_params = %w[utm_source utm_medium utm_campaign utm_term utm_content]
    utm_params.each do |param|
      @lead[param] = params[param] if params[param].present?
    end
    
    respond_to do |format|
      if @lead.save
        # Send confirmation email
        LeadMailer.confirmation_email(@lead).deliver_later
        
        # Store user type in session for confirmation page
        session[:confirmed_lead] = {
          id: @lead.id,
          user_type: @lead.user_type,
          email: @lead.email,
          timestamp: Time.current.to_i
        }
        
        format.html { redirect_to confirmation_path }
        format.json { render json: { status: "success", redirect: confirmation_path }, status: :created }
        format.js
      else
        format.html { redirect_to root_path, alert: @lead.errors.full_messages.join(", ") }
        format.json { render json: { status: "error", errors: @lead.errors.full_messages }, status: :unprocessable_entity }
        format.js
      end
    end
  end
  
  def confirmation
    # Ensure user came from form submission
    unless session[:confirmed_lead].present?
      redirect_to root_path
      return
    end
    
    @user_type = session[:confirmed_lead]["user_type"]
    @email = session[:confirmed_lead]["email"]
    
    # Clear session after 1 hour to prevent indefinite access
    if session[:confirmed_lead]["timestamp"] < Time.current.to_i - 1.hour.to_i
      session.delete(:confirmed_lead)
      redirect_to root_path
      return
    end
  end
  
  private
  
  def lead_params
    params.require(:lead).permit(:email, :company_name, :user_type)
  end
end
