class RenameUsersToolsToToolsUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :users_tools, :tools_users
  end
end
