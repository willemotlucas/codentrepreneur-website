class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :paymentable, polymorphic: true
      t.references :user, foreign_key: true
      t.decimal :amount, precision: 5, scale: 2, null: false
      t.datetime :created_at

      t.timestamps

      add_index :payments, [:paymentable, :user], unique: true
    end
  end
end
