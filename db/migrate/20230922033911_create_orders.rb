class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :billing_amount
      t.string :postage

      t.timestamps
    end
  end
end
