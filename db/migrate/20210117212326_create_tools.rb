class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
