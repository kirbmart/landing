class LeadMailer < ApplicationMailer
  default from: 'waitlist@yourmarketplace.com'
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.confirmation_email.subject
  #
  def confirmation_email(lead)
    @lead = lead
    @user_type = lead.user_type.present? ? lead.user_type.capitalize : "User"
    
    mail(
      to: lead.email,
      subject: "Welcome to Our Wholesale Marketplace Waitlist!"
    )
  end
end
