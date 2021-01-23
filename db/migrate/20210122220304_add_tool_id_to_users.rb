class AddToolIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tool_id, :integer
  end
end
