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
    
    if record.received.present?
      if record.blood_group == 'A+'
        if record.received > @A
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      elsif record.blood_group == 'A-'
        if record.received > @a
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      elsif record.blood_group == 'B+'
        if record.received > @B
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      elsif record.blood_group == 'B-'
        if record.received > @b
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      elsif record.blood_group == 'AB+'
        if record.received > @AB
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      elsif record.blood_group == 'AB-'
        if record.received > @ab
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      elsif record.blood_group == 'O-'
        if record.received > @O
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      elsif record.blood_group == 'O+'
        if record.received > @o
          record.errors.add( :*,"Blood Bank don't have the entered ml of Blood")
        end
      end
    else
      record.errors.add( :*,"Request can only be accept if entered ml of blood is more then 0")
    end
    if Dashboard.exists?(user_id: Current.user.id) && record.received == 0
      latest = Dashboard.where(user_id: Current.user.id).last.created_at
      number_of_days = (Time.now - latest)/(60*60*24)
      number_of_days <= 90
      if Current.user.gender == "Male"
        record.errors.add(:*," You can only donate blood once in 3 month period")
      else
        record.errors.add(:*," You can only donate blood once in 4 month period")
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
