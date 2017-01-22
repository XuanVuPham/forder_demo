class Coupon < ApplicationRecord
  acts_as_paranoid
  belongs_to :shop
  belongs_to :user
end
