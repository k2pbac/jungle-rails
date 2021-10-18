class User < ActiveRecord::Base

  has_secure_password
  validates_uniqueness_of :email
  validate :email, presence: true
  validate :name, presence: true
  validate :password_and_confirmation

  def password_and_confirmation
    errors.add(:password, "passwords don't match") if password != password_confirmation
  end

end
