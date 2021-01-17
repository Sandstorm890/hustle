class Employer < ApplicationRecord
    has_many :jobs
    has_many :users, through: :jobs
    has_secure_password
end
