class ChangeSkillsTypeToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :skills, :type, :category
  end
end
