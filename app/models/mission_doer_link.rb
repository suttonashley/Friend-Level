class MissionDoerLink < ApplicationRecord
  belongs_to :missions,
             :class_name => 'Task',
             :foreign_key => 'mission_id'
  belongs_to :doers,
             :class_name => 'User',
             :foreign_key => 'doer_id'
end
