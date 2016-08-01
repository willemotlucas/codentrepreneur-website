class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :title, null: false, default: ""
      t.integer :step_type, default: 0
      t.string :video_url, unique: true
      t.string :video_duration
      t.string :slug
      t.text :explanations
      t.integer :order, null: false, unique: true
      t.datetime :created_at, default: DateTime.now
      t.datetime :updated_at

      t.timestamps
    end
  end
end
