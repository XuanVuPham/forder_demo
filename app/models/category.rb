class Category < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name, [:name, :id]]
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed? || super
  end

  has_many :products

  scope :asc_by_name, ->{order :name}

  validates :name, presence: true, uniqueness: true
end
