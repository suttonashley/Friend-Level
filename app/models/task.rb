class Task < ApplicationRecord
  belongs_to :user
  has_many :mission_doers
  has_many :doers,
           :through => :mission_doers,
           :class_name => 'User',
           :foreign_key => 'doer_id'
end
