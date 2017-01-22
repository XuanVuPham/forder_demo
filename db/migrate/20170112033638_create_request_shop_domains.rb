class CreateRequestShopDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :request_shop_domains do |t|
      t.integer :status, default: 0
      t.references :shop, foreign_key: true
      t.references :domain, foreign_key: true

      t.timestamps
    end
  end
end
