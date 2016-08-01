class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :ratingable, polymorphic: true
      t.references :user, foreign_key: true
      t.integer :note, null: false
      t.text :comment
      t.datetime :created_at, default: DateTime.now

      t.timestamps
    end
  end
end
