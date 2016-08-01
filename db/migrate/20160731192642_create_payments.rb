class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :paymentable, polymorphic: true
      t.references :user, foreign_key: true
      t.decimal :amount, null: false
      t.datetime :created_at, default: DateTime.now

      t.timestamps
    end
  end
end
