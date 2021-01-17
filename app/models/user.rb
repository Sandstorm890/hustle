class User < ApplicationRecord
    has many :jobs
    has_many :employers, through: :jobs
    has_secure_password
end
