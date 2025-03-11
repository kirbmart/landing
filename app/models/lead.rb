class Lead < ApplicationRecord
  VALID_USER_TYPES = ['brand', 'retailer'].freeze

  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :user_type, inclusion: { in: VALID_USER_TYPES, message: "must be either 'brand' or 'retailer'" }, allow_nil: true
  
  before_save :downcase_email
  
  private
  
  def downcase_email
    self.email = email.downcase if email.present?
  end
end
