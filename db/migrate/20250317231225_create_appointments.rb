class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.references :tutor_profile, null: false, foreign_key: true
      t.integer :student_id, null: false
      t.datetime :appointment_time
      t.integer :status
      t.text :notes

      t.timestamps
    end
    add_foreign_key :appointments, :users, column: :student_id
  end
end
