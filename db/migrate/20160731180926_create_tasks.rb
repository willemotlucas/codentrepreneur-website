class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :order, null: false
      t.datetime :created_at
      t.datetime :updated_at
      t.references :taskable, polymorphic: true

      t.timestamps
    end
  end
end
