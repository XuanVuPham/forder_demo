class OrderProduct < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :order
  belongs_to :product
  belongs_to :coupon

  has_many :events , as: :eventable

  enum status: {pending: 0, accepted: 1, rejected: 2, done: 3}
  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :product, prefix: true
  delegate :email, to: :user, prefix: true

  def total_price
    product.price * quantity
  end

  scope :accepted, ->{where status: OrderProduct.statuses[:accepted]}
  scope :done, ->{where status: OrderProduct.statuses[:done]}
  scope :rejected, ->{where status: OrderProduct.statuses[:rejected]}
  scope :on_today, ->{where "date(order_products.created_at) = date(now())"}
  scope :by_user, ->user {where user: user}
  scope :group_product, -> do
    joins(:product)
      .select("order_products.product_id, sum(order_products.quantity) as total")
      .group("order_products.product_id")
      .order("total DESC")
  end
  scope :history_by_day_with_status, ->(shop_id, status) do
    joins(:product, :order)
      .select("products.name as name, sum(quantity) as quantity,
        sum(quantity) * products.price as price, order_products.created_at as
        created_at, products.id as product_id, order_products.status as status,
        order_products.id as id")
      .where("order_products.status = ? and orders.status = ? and
        orders.shop_id = ?", status, Order.statuses[:done], shop_id)
      .group("order_products.product_id,
        DATE_FORMAT(order_products.created_at, '%Y%m%d')")
  end
  scope :order_products_accepted, -> do
    joins(:product, :order)
      .select("products.name as name, sum(quantity) * products.price as price,
        sum(quantity) as quantity, products.id as product_id, orders.id as shop_id
        , order_products.status as status, order_products.id as id")
      .where("order_products.status = ? and
        date(orders.created_at) = date(now())",
        OrderProduct.statuses[:accepted])
      .group("order_products.product_id")
  end

  def send_notification_order
    if self.rejected?
      self.events.create message: :rejected, user_id: self.user.id,
        eventitem_id: self.id
    else
      self.events.create message: :accepted, user_id: self.user.id,
        eventitem_id: self.id
    end
  end
end
