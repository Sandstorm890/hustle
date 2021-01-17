class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
