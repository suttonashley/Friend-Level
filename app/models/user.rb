class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :friends,
           :through => :friendships

  has_many :tasks
  has_many :missions,
           :class_name => 'Task', foreign_key: :doer_id

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, confirmation: true, presence: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true, length: { in: 6..20 }

  def is_friends_with?(user)
    Friendship.exists?(self, user)
  end

  def accepted_friends
    Friendship.where(user: id, status: :accepted).map(&:friend)
  end

  # def points_with(user)
  #   Task.where(doer_id: user.id, user_id: self.id).accepted.map(&:points).inject(:+)
  # end
  #
  # def points_for(user)
  #   Task.where(doer_id: self.id, user_id: user.id).accepted.map(&:points).inject(:+)
  # end

  def points
    Task.where(doer_id: self.id).accepted.map(&:points).inject(:+)
  end
  #
  # def top_three_friends
  #   self.friends.sort{|a,b| a.points_for(self) <=> b.points_for(self)}.first(3)
  # end


  def top_friends_that_you_earn_points_from(limit)
    missions.accepted.group(:creator).sum(:points).sort_by { |name, point| point}.reverse[0..limit]
  end

  def top_friends_that_earn_points_from_you(limit)
    tasks.accepted.group(:doer).sum(:points).sort_by { |name, point| point}.reverse[0..limit]
  end

  def friend_comparison

  end


#ed's fix in the editor
# missions.accepted.group(:creator).sum(:points).sort_by {|hsh| -hsh.values.first}[0..limit]
#ed's version in terminal
# s.missions.accepted.group(:creator).sum(:points).map { |k, v| {k.username => v}}.sort_by {|hsh| -hsh.values.first}

# after_action :filter
#   def filter
  # if current_user == owner
  #   dont filter anything
  # elsif current_user friends owner
  #   show some things
  # else
  #   show few things
  # end
  # end


end
