class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :subscriptionable, polymorphic: true, index: { name: 'index_subscriptions_on_subsable_type_and_subsable_id' }
      t.references :user, foreign_key: true
      t.datetime :created_at

      t.timestamps

      add_index :subscriptions, [:subscriptionable, :user], unique: true
    end
  end
end
