class AddTaskToStep < ActiveRecord::Migration[5.0]
  def change
    add_reference :steps, :task, foreign_key: true
    add_index :steps, [:task, :order], unique: true
  end
end
