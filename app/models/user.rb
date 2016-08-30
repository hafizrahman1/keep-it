class User < Sinatra::Base
  has_many :notes

  has_secure_password
end
