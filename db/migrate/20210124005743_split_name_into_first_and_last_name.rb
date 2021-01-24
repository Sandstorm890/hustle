class SplitNameIntoFirstAndLastName < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name 
    remove_column :employers, :name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :employers, :first_name, :string
    add_column :employers, :last_name, :string
  end
end
