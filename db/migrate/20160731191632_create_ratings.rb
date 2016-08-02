class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :ratingable, polymorphic: true
      t.references :user, foreign_key: true
      t.integer :note, null: false
      t.text :comment, default: "Aucun commentaire n'a été donné"
      t.datetime :created_at

      t.timestamps

      add_index :tasks, [:ratingable, :user], unique: true
    end
  end
end
