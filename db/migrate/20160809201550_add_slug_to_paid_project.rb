class AddSlugToPaidProject < ActiveRecord::Migration[5.0]
  def change
    add_column :paid_projects, :slug, :string
    add_index :paid_projects, :slug, unique: true
  end
end
