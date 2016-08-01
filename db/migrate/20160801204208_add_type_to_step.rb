class AddTypeToStep < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE Steps MODIFY step_type ENUM('video', 'instructions');
    SQL
  end

  def down
    remove_column :steps, :step_type
  end
end
