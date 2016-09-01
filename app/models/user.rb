class User < ActiveRecord::Base
  has_many :notes
  has_many :topics, through: :notes
  has_secure_password
end
