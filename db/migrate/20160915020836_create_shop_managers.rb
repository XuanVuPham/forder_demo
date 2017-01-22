class CreateShopManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_managers do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.integer :role, default: 0
      t.datetime :deleted_at, index: true

      t.timestamps
    end
    add_index :shop_managers, [:shop_id, :user_id]
  end
end
