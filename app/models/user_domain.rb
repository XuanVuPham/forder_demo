class UserDomain < ApplicationRecord
  belongs_to :user
  belongs_to :domain

  after_destroy :destroy_data
  def destroy_data
    self.user.products.each do |product|
      ProductDomain.destroy_all domain_id: self.domain.id, product_id: product.id
    end
    self.user.shops.each do |shop|
      ShopDomain.destroy_all domain_id: self.domain.id, shop_id: shop.id
    end
  end
end
