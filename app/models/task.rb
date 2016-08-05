class Task < ApplicationRecord
  belongs_to :creator,
             :class_name => 'User',
             :foreign_key => 'user_id'

  belongs_to :doer,
             :class_name => 'User',
             :foreign_key => 'doer_id',
             :optional => true

  validates :title, presence: true, length: { maximum: 14 }
  validates :details, length: { maximum: 23 }
  validates :due_date, presence: true
  validate :not_past_date

  # enum does this for you
  # scope :accepted, -> {where(status: :accepted)}
  # scope :pending, -> {where(status: :pending)}
  # scope :requested, -> {were(status: :requested)}
  # scope :declined, -> {where(status: :declined)}

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
    if self.user_id == creator.id && self.status == "pending"
      self.status = :accepted
      self.save
    end
  end

  def decline(creator)
    if self.user_id == creator.id && self.status == :pending
      self.status = :declined
      self.save
    end
  end

  def not_past_date
    errors.add(:due_date, 'error message') unless self.due_date.future?
  end


end
