class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false, message: "This email is already registered!"}
  validates :password, presence: true, length: { minimum: 6 }
end
