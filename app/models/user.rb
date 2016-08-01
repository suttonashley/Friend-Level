class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :friends, :through => :friendships

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, confirmation: true, presence: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true, length: { in: 6..20 }


  def is_friends_with?(user)
    Friendship.exists?(self, user)
  end

  def accepted_friends
    Friendship.where(user: id, status: :accepted).map(&:friend)
  end

end
