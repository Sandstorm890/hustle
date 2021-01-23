class AddAddressToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :address, :string
  end
end
