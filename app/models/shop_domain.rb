class ShopDomain < ApplicationRecord
  belongs_to :domain
  belongs_to :shop

  enum status: {pending: 0, approved: 1, rejected: 2}

  scope :by_domain, ->domain {where domain_id: domain.id}
  def create_event_request_shop user_id, shop_domain
    if shop_domain.pending?
      Event.create message: :pending,
        user_id: user_id, eventable_id: domain.id, eventable_type: ShopDomain.name,
        eventitem_id: self.id
    elsif shop_domain.approved?
      Event.create message: :approved,
        user_id: user_id, eventable_id: domain.id, eventable_type: ShopDomain.name,
        eventitem_id: self.id
    else
      Event.create message: :rejected,
        user_id: user_id, eventable_id: domain.id, eventable_type: ShopDomain.name,
        eventitem_id: self.id
    end
  end
end
