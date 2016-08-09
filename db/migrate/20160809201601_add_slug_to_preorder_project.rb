class AddSlugToPreorderProject < ActiveRecord::Migration[5.0]
  def change
    add_column :preorder_projects, :slug, :string
    add_index :preorder_projects, :slug, unique: true
  end
end
