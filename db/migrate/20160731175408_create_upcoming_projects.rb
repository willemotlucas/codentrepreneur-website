class CreateUpcomingProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :upcoming_projects do |t|
      t.string :title, null: false, default: ""
      t.string :image_url
      t.string :video_url
      t.text :short_description, null: false
      t.string :duration
      t.boolean :featured, null: false, default: false
      t.boolean :active, null: false, default: true
      t.datetime :created_at, default: DateTime.now
      t.datetime :updated_at

      t.timestamps
    end
  end
end
