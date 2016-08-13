class AddQuantityToPreorderProject < ActiveRecord::Migration[5.0]
  def change
    add_column :preorder_projects, :quantity, :integer, default: -1
  end
end
