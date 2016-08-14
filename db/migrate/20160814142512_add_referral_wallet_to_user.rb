class AddReferralWalletToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referral_wallet, :decimal, precision: 5, scale: 2, default: 0
  end
end
