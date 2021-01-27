class AddRateToJobsUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs_users, :rate, :integer
  end
end
