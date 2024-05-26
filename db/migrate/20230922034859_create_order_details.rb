class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.references :orders, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true
      t.integer :num, null: false

      t.timestamps
    end
  end
end
