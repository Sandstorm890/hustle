class AddJobIdToEmployers < ActiveRecord::Migration[6.1]
  def change
    add_column :employers, :job_id, :integer
  end
end
