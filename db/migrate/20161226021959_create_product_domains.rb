class CreateProductDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :product_domains do |t|
      t.references :product, foreign_key: true
      t.references :domain, foreign_key: true

      t.timestamps
    end
  end
end
