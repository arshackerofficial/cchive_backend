class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.decimal :rating
      t.references :user, null: false, foreign_key: true
      t.references :reviewable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
