# Preview all emails at http://localhost:3000/rails/mailers/lead_mailer
class LeadMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/lead_mailer/confirmation_email
  def confirmation_email
    LeadMailer.confirmation_email
  end
end
