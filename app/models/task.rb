class Task < ApplicationRecord
  belongs_to :creator,
             :class_name => 'User',
             :foreign_key => 'user_id'

  belongs_to :doer,
             :class_name => 'User',
             :foreign_key => 'doer_id',
             :optional => true
end
