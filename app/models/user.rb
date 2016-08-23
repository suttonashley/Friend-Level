class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :friends,
  :through => :friendships

  has_many :tasks
  has_many :missions,
  :class_name => 'Task', foreign_key: :doer_id


  has_attached_file :avatar, styles: {
      small: "160x160",
      medium: "200x200>",
      thumb: "100x100>"
      }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, confirmation: true, presence: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true, length: { in: 6..20 }

  def is_friends_with?(user)
    Friendship.exists?(self, user)
  end

  def status_with(user)
    return "NONE" unless Friendship.exists?(self, user)
    Friendship.find_by(user_id: user.id, friend_id: id).status
  end

  def accepted_friends
    Friendship.where(user: id, status: :accepted).map(&:friend)
  end

  def self.friend_level(for_doer:, with_creator:)
    Task.accepted.where(doer_id: for_doer, user_id: with_creator).sum(:points)
  end

  # ashley = @user
  #
  # Alby = current_user
  #
  # mypoints = friend_level for_doer: current_user, with_creator: @user
  #
  # herpoints = friend_level for_doer: @user, with_creator: current_user
  #
  # ashleys_debt = mypoints / herpoints


  # def points_with(user)
  #   Task.where(doer_id: user.id, user_id: self.id).accepted.map(&:points).inject(:+)
  # end
  #
  # def points_for(user)
  #   Task.where(doer_id: self.id, user_id: user.id).accepted.map(&:points).inject(:+)
  #   tasks.accepted.where()
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

  def friend_comparison(user, limit)


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
