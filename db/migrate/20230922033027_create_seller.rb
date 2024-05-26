class CreateSeller < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.references :users, null: false, foreign_key: true
      t.string :seller_name
      t.string :description
      t.integer :postal_code
      t.string :prefecture
      t.string :address1
      t.string :address2

      t.timestamps
    end
  end
end