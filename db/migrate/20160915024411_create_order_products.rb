class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.float :price
      t.text :notes
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.references :coupon, foreign_key: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
    add_index :order_products, [:order_id, :product_id]
  end
end
