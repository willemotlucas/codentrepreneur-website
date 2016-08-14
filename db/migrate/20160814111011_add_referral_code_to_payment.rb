class AddReferralCodeToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :referral_code, :string
    add_index :payments, [:user_id, :referral_code], unique: true
    add_index :payments, :referral_code
  end
end
