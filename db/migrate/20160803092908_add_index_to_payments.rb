class AddIndexToPayments < ActiveRecord::Migration[5.0]
  def change
  	add_index :payments, [:paymentable_id, :paymentable_type, :user_id], unique: true, name: "index_payments_on_paymentable_id_and_type_and_user"
  end
end
