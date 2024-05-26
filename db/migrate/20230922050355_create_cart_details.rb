class CreateCartDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_details do |t|
      t.references :carts, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true
      t.integer :num
      t.timestamps
    end
  end
end
