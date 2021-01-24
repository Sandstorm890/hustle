class Employer < ApplicationRecord
    has_many :jobs
    has_many :users, through: :jobs
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    validates :company, presence: true
    validates :password, length: {in: 3..20}
    has_secure_password
end
