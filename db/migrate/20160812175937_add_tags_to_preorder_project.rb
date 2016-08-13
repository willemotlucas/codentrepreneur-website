class AddTagsToPreorderProject < ActiveRecord::Migration[5.0]
  def change
    add_column :preorder_projects, :tags_list, :string
  end
end
