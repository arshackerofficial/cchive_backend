class CreateTutorProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :tutor_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :subjects, array: true, default: []

      t.timestamps
    end
  end
end
