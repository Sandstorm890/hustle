class User < ApplicationRecord
    has_and_belongs_to_many :jobs
    has_many :employers, through: :jobs
    has_and_belongs_to_many :tools
    has_many :skills
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    validates :password, length: {in: 3..20}
    has_secure_password
end
