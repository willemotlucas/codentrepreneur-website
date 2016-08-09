class AddSlugToFreeProject < ActiveRecord::Migration[5.0]
  def change
    add_column :free_projects, :slug, :string
    add_index :free_projects, :slug, unique: true
  end
end
