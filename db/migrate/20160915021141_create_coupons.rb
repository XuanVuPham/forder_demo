class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.text :description
      t.integer :coupon_type
      t.integer :discount_type
      t.integer :value
      t.string :code
      t.datetime :start_at
      t.datetime :end_at
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
    add_index :coupons, :name
    add_index :coupons, [:shop_id, :user_id]
  end
end
