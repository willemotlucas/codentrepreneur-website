class RenameTaskOrderToTaskOrderPrefix < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tasks, :order, :task_order
  end
end
