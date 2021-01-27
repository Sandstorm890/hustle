class Job < ApplicationRecord
    has_many :jobs_users
    has_many :users, through: :jobs_users
    belongs_to :employer

    validates :address, presence: true
    validates :category, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :rate, presence: true

    

    def self.order_by_rate
        order(rate: :desc)
    end

    def display_link_info
        self.employer.company + " - " + self.category + " - " + "$" + self.rate.to_s + "0/hr"
    end
end
