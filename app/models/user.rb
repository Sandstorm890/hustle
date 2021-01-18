class User < ApplicationRecord
    has_many :jobs
    has_many :employers, through: :jobs
    has_secure_password
end
