class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image
      t.integer :status, default: 1
      t.references :category, index: true, foreign_key: true
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
    add_index :products, :name
    add_index :products, [:shop_id, :user_id]
  end
end
