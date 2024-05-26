class CreateProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :seller, null: false, foreign_key: true
      t.string :name, null: false
      t.string :picture, null: false
      t.integer :price, null: false
      t.integer :sale_price
      t.integer :stock, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.string :tag, null: false

      t.timestamps
    end
  end
end
