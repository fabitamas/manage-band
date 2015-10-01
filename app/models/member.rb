class Member < ActiveRecord::Base
  attr_accessible :name, :email

  validates(:name, presence: true, length: {maximum: 40})

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, format: {with: VALID_EMAIL})

end
