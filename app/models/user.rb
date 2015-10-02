class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false, message: "This email is already registered!"}
  validates :password, presence: true, length: { minimum: 6 }


  def name 
    "#{self.first_name} " + "#{self.last_name}"
  end
end
