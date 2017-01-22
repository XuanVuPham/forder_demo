class Domain < ApplicationRecord
  has_many :user_domains
  has_many :shop_domains
  has_many :product_domains
  has_many :users, through: :user_domains
  has_many :shops, through: :shop_domains
  has_many :products, through: :product_domains
  has_many :request_shop_domains
  has_many :orders

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name, [:name, :id]]
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed? || super
  end

  def belong_to? user
    self.owner == user.id
  end

  enum status: {professed: 1, secret: 2}
  scope :by_creator, -> user_id{where owner: user_id}
end
