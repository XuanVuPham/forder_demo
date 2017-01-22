class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0, null: false
      t.datetime :end_at
      t.text :notes
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.references :coupon, foreign_key: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
    add_index :orders, [:shop_id, :user_id]
  end
end
