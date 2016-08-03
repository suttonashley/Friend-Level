class Task < ApplicationRecord
  belongs_to :creator,
             :class_name => 'User',
             :foreign_key => 'user_id'

  belongs_to :doer,
             :class_name => 'User',
             :foreign_key => 'doer_id',
             :optional => true


  enum status: {
     requested: 'requested',
     pending:   'pending',
     accepted:  'accepted',
     declined:  'declined'
  }

 def request(doer)
   unless self.creator.id == doer.id
     self.doer_id = doer.id
     self.status = :pending
     self.save
   end
 end

  def accept(creator)
    if self.user_id == creator.id
      self.status = :accepted
      self.save
    end
  end
end
