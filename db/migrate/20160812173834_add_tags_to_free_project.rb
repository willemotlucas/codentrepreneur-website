class AddTagsToFreeProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :free_projects, :tags_list, :string
  end
end
