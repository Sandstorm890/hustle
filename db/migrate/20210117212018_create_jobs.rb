class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :type
      t.datetime :start_date
      t.datetime :end_date
      t.float :rate
      t.string :requirements
      t.integer :user_id
      t.integer :employer_id

      t.timestamps
    end
  end
end
