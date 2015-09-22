class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false,
    message: "This email is already registered!"}
end
