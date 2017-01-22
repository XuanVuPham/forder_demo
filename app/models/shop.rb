class Shop < ApplicationRecord
  acts_as_paranoid

  ratyrate_rateable Settings.rate

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name, [:name, :id]]
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed? || super
  end

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :reviews, as: :reviewable
  has_many :comments, as: :commentable
  has_many :shop_managers, dependent: :destroy
  has_many :users, through: :shop_managers
  has_many :orders
  has_many :order_products, through: :orders
  has_many :products
  has_many :tags, through: :products
  has_many :events , as: :eventable
  has_many :shop_domains
  has_many :domains, through: :shop_domains
  has_many :request_shop_domains

  enum status: {pending: 0, active: 1, closed: 2, rejected: 3, blocked: 4}

  after_create :create_shop_manager, :send_notification_after_requested
  after_update :send_notification_after_confirmed
  after_update_commit :send_notification

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true
  validates :time_auto_reject, presence: true, allow_nil: true

  mount_uploader :cover_image, ShopCoverUploader
  mount_uploader :avatar, ShopAvatarUploader

  validate :image_size

  delegate :name, to: :owner, prefix: :owner, allow_nil: true
  delegate :email, to: :owner, prefix: :owner

  scope :by_date_newest, ->{order created_at: :desc}
  scope :top_shops, ->{active.by_date_newest.limit Settings.index.max_shops}

  scope :by_active, ->{where status: :active}
  scope :of_owner, -> owner_id {where owner_id: owner_id}
  scope :by_shop, -> shop_id {where id: shop_id if shop_id.present?}

  scope :of_ids, -> ids {where id: ids}
  scope :shop_in_domain, -> domain_id do
    joins(:shop_domains)
      .where "shop_domains.domain_id = ? and shop_domains.status = ?", domain_id,
      ShopDomain.statuses[:approved]
  end

  def is_owner? user
    owner == user
  end

  def all_tags
    tags.uniq
  end

  def get_shop_manager_by user
    shop_managers.by_user(user).first
  end

  def requested? domain
    Shop.of_ids(RequestShopDomain.shop_ids_by_domain(domain.id)).include? self
  end

  def in_domain? domain
    self.domains.include? domain
  end

  def request_status domain
    self.shop_domains.by_domain(domain).first
  end

  private
  def create_shop_manager
    shop_managers.create user_id: owner_id
  end

  def image_size
    max_size = Settings.pictures.max_size
    if cover_image.size > max_size.megabytes
      errors.add :cover_image,
        I18n.t("pictures.error_message", max_size: max_size)
    end
    if avatar.size > max_size.megabytes
      errors.add :avatar, I18n.t("pictures.error_message", max_size: max_size)
    end
  end

  def send_notification_after_requested
    ShopNotification.new(self).send_when_requested
  end

  def send_notification_after_confirmed
    if self.status_changed? && !self.pending?
      ShopNotification.new(self).send_when_confirmed
    end
  end

  def send_notification
    if self.status_changed? && !self.pending?
      Event.create message: self.status, user_id: owner_id,
        eventable_id: id, eventable_type: Shop.name
    end
  end
end
