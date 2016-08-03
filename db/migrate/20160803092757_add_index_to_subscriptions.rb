class AddIndexToSubscriptions < ActiveRecord::Migration[5.0]
  def change
  	add_index :subscriptions, [:subscriptionable_type, :subscriptionable_id, :user_id], unique: true, name: 'index_subscriptions_on_subsable_type_and_subsable_id_and_user' 
  end
end
