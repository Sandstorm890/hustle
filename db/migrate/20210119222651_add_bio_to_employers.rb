class AddBioToEmployers < ActiveRecord::Migration[6.1]
  def change
    add_column :employers, :bio, :text
  end
end
