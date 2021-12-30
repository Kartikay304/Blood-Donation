class ReceivedValidator < ActiveModel::Validator 
  def validate(record)
    @A=1+Dashboard.where(blood_group: 'A+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'A+', approved: '1').sum(:received)
    @a=1+Dashboard.where(blood_group: 'A-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'A-', approved: '1').sum(:received)
    @B=1+Dashboard.where(blood_group: 'B+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'B+', approved: '1').sum(:received)
    @b=1+Dashboard.where(blood_group: 'B-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'B-', approved: '1').sum(:received)
    @AB=1+Dashboard.where(blood_group: 'AB+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'AB+', approved: '1').sum(:received)
    @ab=1+Dashboard.where(blood_group: 'AB-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'AB-', approved: '1').sum(:received)
    @O=1+Dashboard.where(blood_group: 'O+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'O+', approved: '1').sum(:received)
    @o=1+Dashboard.where(blood_group: 'O-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'O-', approved: '1').sum(:received)
    
    if  record.received == nil
      record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
    end
    if record.blood_group== 'A+'
      if record.received > @A
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    elsif record.blood_group== 'A-'
      if record.received > @a
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    elsif record.blood_group== 'B+'
      if record.received > @B
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    elsif record.blood_group== 'B-'
      if record.received > @b
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    elsif record.blood_group== 'AB+'
      if record.received > @AB
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    elsif record.blood_group== 'AB-'
      if record.received > @ab
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    elsif record.blood_group== 'O-'
      if record.received > @O
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    elsif record.blood_group== 'O+'
      if record.received > @o
        record.errors.add( :received,"Blood Bank don't have the reqired ml of Blood")
      end
    end
  end
end

class Dashboard < ApplicationRecord
  validates :username, presence: true
  validates :camp, presence: true
  validates :blood_group, presence: true
  belongs_to :user
  validates_with ReceivedValidator
end
