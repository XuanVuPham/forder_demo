class ShopManager < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :shop

  enum role: {staff: 0, owner: 1}

  scope :by_user, ->user {where user: user}
end
