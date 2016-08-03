class AddTaskToStep < ActiveRecord::Migration[5.0]
  def change
    add_reference :steps, :task, foreign_key: true
  end
end
