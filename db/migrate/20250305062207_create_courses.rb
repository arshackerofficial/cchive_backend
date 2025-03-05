class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :subject
      t.integer :course_number
      t.text :description
      t.integer :credits

      t.timestamps
    end
  end
end
