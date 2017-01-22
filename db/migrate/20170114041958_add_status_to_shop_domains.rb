class AddStatusToShopDomains < ActiveRecord::Migration[5.0]
  def change
    add_column :shop_domains, :status, :integer
  end
end
