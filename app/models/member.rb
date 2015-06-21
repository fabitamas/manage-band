class Member < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :nick
end
