class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  enum status: {
    requested: 'requested',
    pending:   'pending',
    accepted:  'accepted',
    declined:  'declined'
  }


  def self.request(user, friend)
    unless user == friend || Friendship.exists?(user, friend)
      transaction do
        create(:user => user, :friend => friend, :status => :pending)
        create(:user => friend, :friend => user, :status => :requested)
      end
    end
  end

  def self.accept(user, friend)
    transaction do
      accept_one_side(user, friend)
      accept_one_side(friend, user)
    end
  end

  def self.accept_one_side(user, friend)
    request = find_by_user_id_and_friend_id(user.id, friend.id)
    request.status = :accepted
    request.save!
  end

  def self.exists?(user, friend)
    user_friendship   = Friendship.where(:user_id => user.id, :friend_id => friend.id).first
    friend_friendship = Friendship.where(:user_id => friend.id, :friend_id => user.id).first

    return !user_friendship.nil? && !friend_friendship.nil?
  end
end
