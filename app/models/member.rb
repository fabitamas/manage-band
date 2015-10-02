class Member < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  before_save {|member| member.email = email.downcase}

  validates(:name, presence: true, length: {maximum: 40})

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, format: {with: VALID_EMAIL}, uniqueness: {case_sensitive: false})
  validates(:password, presence: true, length: {minimum: 6})
  validates(:password_confirmation, presence: true)

end
