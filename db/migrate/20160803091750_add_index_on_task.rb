class AddIndexOnTask < ActiveRecord::Migration[5.0]
  def change
      add_index :tasks, [:taskable_id, :taskable_type, :order], unique: true
  end
end
