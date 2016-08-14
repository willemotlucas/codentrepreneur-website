class AddReferralWalletAmountToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :referral_wallet_amount, :decimal, precision: 5, scale: 2
  end
end
