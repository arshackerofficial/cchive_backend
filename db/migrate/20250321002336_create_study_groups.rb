class CreateStudyGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :study_groups do |t|
      t.string :name
      t.text :description
      t.integer :creator_id, null: false

      t.timestamps
    end
    add_foreign_key :study_groups, :users, column: :creator_id
  end
end
