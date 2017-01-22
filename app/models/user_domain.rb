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

  def create_event_add_user_domain user_id
    Event.create message: :join_domain,
      user_id: user_id, eventable_id: self.domain.id, eventable_type: UserDomain.name,
      eventitem_id: self.user.id
  end
end
