class CreateUsersJobsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs_users do |t|
      t.belongs_to :user
      t.belongs_to :job
      t.timestamps
    end
  end
end
