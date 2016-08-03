class AddIndexToRatings < ActiveRecord::Migration[5.0]
  def change
  	add_index :ratings, [:ratingable_id, :ratingable_type, :user_id], unique: true
  end
end
