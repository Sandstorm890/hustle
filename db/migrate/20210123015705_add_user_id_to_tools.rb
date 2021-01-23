class AddUserIdToTools < ActiveRecord::Migration[6.1]
  def change
    add_column :tools, :user_id, :integer
  end
end
