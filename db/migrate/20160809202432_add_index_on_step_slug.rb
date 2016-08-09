class AddIndexOnStepSlug < ActiveRecord::Migration[5.0]
  def change
  	add_index :steps, :slug, unique: true
  end
end
