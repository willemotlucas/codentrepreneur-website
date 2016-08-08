class RenameStepOrderToStepOrderPrefix < ActiveRecord::Migration[5.0]
  def change
  	rename_column :steps, :order, :step_order
  end
end
