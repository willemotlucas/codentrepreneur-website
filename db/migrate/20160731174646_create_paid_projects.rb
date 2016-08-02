class CreatePaidProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :paid_projects do |t|
      t.string :title, null: false
      t.string :image_url
      t.string :video_url
      t.text :short_description, null: false
      t.string :duration
      t.boolean :featured, null: false, default: false
      t.boolean :active, null: false, default: true
      t.text :long_description
      t.decimal :price, precision: 5, scale: 2, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
