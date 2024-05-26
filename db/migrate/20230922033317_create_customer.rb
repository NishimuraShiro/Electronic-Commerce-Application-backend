class CreateCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :customer_name
      t.integer :postal_code
      t.string :prefecture
      t.string :address1
      t.string :address2

      t.timestamps
    end
  end
end
