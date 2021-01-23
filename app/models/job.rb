class Job < ApplicationRecord
    has_and_belongs_to_many :users
    belongs_to :employer

    validates :address, presence: true
    validates :category, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :rate, presence: true

    def self.order_by_rate
        order(rate: :desc)
    end
end
