class User < ApplicationRecord
    has_many :dashboards
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 50}
    validates :first_name, presence: true, length: {minimum: 3, maximum: 50}
    validates :last_name, presence: true, length: {minimum: 3, maximum: 50}
    validates :age, presence: true, length: {minimum: 1, maximum: 2}
    validates :blood_group, presence: true
    validates :gender, presence: true
    validates :street, presence: true, length: {minimum: 3, maximum: 50}
    validates :additional_info, length: {minimum: 3, maximum: 50}
    validates :pin_code, presence: true
    validates :city, presence: true
    validates :country, presence: true
    validates :code, presence: true
    validates :phone_no, presence: true, length: {minimum: 10, maximum: 10}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}
    has_secure_password
end