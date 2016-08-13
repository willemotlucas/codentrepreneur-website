class AddTagsToPaidProject < ActiveRecord::Migration[5.0]
  def change
    add_column :paid_projects, :tags_list, :string
  end
end
