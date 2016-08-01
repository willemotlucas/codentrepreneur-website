class AddRoleToUser < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE Users MODIFY user_role ENUM('normal', 'admin');
    SQL
  end

  def down
    remove_column :users, :user_role
  end
end
