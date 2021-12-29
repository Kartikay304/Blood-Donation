class ReceivedValidator < ActiveModel::Validator 
  def validate(record)
    @A=Dashboard.where(blood_group: 'A+').sum(:donated)-Dashboard.where(blood_group: 'A+').sum(:received)
    @a=Dashboard.where(blood_group: 'A-').sum(:donated)-Dashboard.where(blood_group: 'A-').sum(:received)
    @B=Dashboard.where(blood_group: 'B+').sum(:donated)-Dashboard.where(blood_group: 'B+').sum(:received)
    @b=Dashboard.where(blood_group: 'B-').sum(:donated)-Dashboard.where(blood_group: 'B-').sum(:received)
    @AB=Dashboard.where(blood_group: 'AB+').sum(:donated)-Dashboard.where(blood_group: 'AB+').sum(:received)
    @ab=Dashboard.where(blood_group: 'AB-').sum(:donated)-Dashboard.where(blood_group: 'AB-').sum(:received)
    @O=Dashboard.where(blood_group: 'O+').sum(:donated)-Dashboard.where(blood_group: 'O+').sum(:received)
    @o=Dashboard.where(blood_group: 'O-').sum(:donated)-Dashboard.where(blood_group: 'O-').sum(:received)
    
    if  record.received == nil
      record.errors.add(:recived, "is not active")
    end
    if record.blood_group== 'A+'
      if record.received > @A
        record.errors.add(:recived, "is not active") 
      end
    elsif record.blood_group== 'A-'
      if record.received > @a
        record.errors.add(:recived, "is not active") 
      end
    elsif record.blood_group== 'B+'
      if record.received > @B
        record.errors.add(:recived, "is not active") 
      end
    elsif record.blood_group== 'B-'
      if record.received > @b
        record.errors.add(:recived, "is not active") 
      end
    elsif record.blood_group== 'AB+'
      if record.received > @AB
        record.errors.add(:recived, "is not active") 
      end
    elsif record.blood_group== 'AB-'
      if record.received > @ab
        record.errors.add(:recived, "is not active") 
      end
    elsif record.blood_group== 'O-'
      if record.received > @O
        record.errors.add(:recived, "is not active") 
      end
    elsif record.blood_group== 'O+'
      if record.received > @o
        record.errors.add(:recived, "is not active") 
      end
    end
  end
end

class Dashboard < ApplicationRecord
  validates :username, presence: true
  validates :camp, presence: true
  validates :blood_group, presence: true

  validates_with ReceivedValidator
end
