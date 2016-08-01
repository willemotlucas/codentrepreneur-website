class AddPreorderProjectToPaidProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :paid_projects, :preorder_project, foreign_key: true
  end
end
