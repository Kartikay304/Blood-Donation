class ReceivedValidator < ActiveModel::Validator 
    def validate(record)
        @A=Userdonation.where(blood_group: 'A+').sum(:donated)-Userdonation.where(blood_group: 'A+').sum(:received)
        @a=Userdonation.where(blood_group: 'A-').sum(:donated)-Userdonation.where(blood_group: 'A-').sum(:received)
        @B=Userdonation.where(blood_group: 'B+').sum(:donated)-Userdonation.where(blood_group: 'B+').sum(:received)
        @b=Userdonation.where(blood_group: 'B-').sum(:donated)-Userdonation.where(blood_group: 'B-').sum(:received)
        @AB=Userdonation.where(blood_group: 'AB+').sum(:donated)-Userdonation.where(blood_group: 'AB+').sum(:received)
        @ab=Userdonation.where(blood_group: 'AB-').sum(:donated)-Userdonation.where(blood_group: 'AB-').sum(:received)
        @O=Userdonation.where(blood_group: 'O+').sum(:donated)-Userdonation.where(blood_group: 'O+').sum(:received)
        @o=Userdonation.where(blood_group: 'O-').sum(:donated)-Userdonation.where(blood_group: 'O-').sum(:received)
      if record.received > @A
        record.errors.add(:recived, "is not active") 
    end
  end
end

class Userdonation < ApplicationRecord
    validates :username, presence: true
    validates :camp, presence: true
    validates :blood_group, presence: true

    validates_with ReceivedValidator
end
