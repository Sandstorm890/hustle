class CreateUsersToolsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users_tools do |t|
        t.belongs_to :user
        t.belongs_to :tool
      t.timestamps
    end
  end
end
