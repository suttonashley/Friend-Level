class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :friends, :through => :friendships


  def is_friends_with?(user)
    Friendship.exists?(self, user)
  end

  def accepted_friends
    Friendship.where(user: id, status: :accepted).map(&:friend)
  end

end
