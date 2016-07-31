class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :friends, :through => :friendships
end
