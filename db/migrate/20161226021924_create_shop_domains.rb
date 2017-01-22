class CreateShopDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_domains do |t|
      t.references :domain, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
