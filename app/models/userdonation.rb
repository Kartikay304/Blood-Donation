class Userdonation < ApplicationRecord
    validates :username, presence: true
    validates :camp, presence: true
    validates :blood_group, presence: true
end
