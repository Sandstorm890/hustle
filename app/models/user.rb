class User < ApplicationRecord
    has_and_belongs_to_many :jobs
    has_many :employers, through: :jobs
    has_and_belongs_to_many :tools
    has_many :skills
    # validates :first_name, presence: true
    # validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    # validates :password_digest, presence: true
    has_secure_password

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid]) do |u|
            u.first_name = response[:info][:first_name]
            u.last_name = response[:info][:last_name]
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end
