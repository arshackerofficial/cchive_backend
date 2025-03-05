class CreateInstructors < ActiveRecord::Migration[7.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :department
      t.string :email

      t.timestamps
    end
  end
end
