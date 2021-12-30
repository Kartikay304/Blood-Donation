class Post < ApplicationRecord 
  validates :title, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 3, maximum: 500}
  validates :username, presence: true
  validates :blood_group, presence: true
end