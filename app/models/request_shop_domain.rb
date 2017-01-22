class RequestShopDomain < ApplicationRecord
  belongs_to :shop
  belongs_to :domain
  
  enum status: {pending: 0, approved: 1, rejected: 2}

  scope :by_domain, ->domain {where domain_id: domain.id}
  scope :by_shop, ->shop {where shop_id: shop.id}
  scope :by_pending, ->{where status: :pending}

  scope :shop_ids_by_domain, -> domain_id do
    where(domain_id: domain_id).pluck :shop_id
  end
end
