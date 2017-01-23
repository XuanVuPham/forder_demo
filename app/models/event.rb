class Event < ApplicationRecord
  include ActionView::Helpers::DateHelper

  after_create_commit :send_notification

  belongs_to :user
  belongs_to :eventable, polymorphic: true

  scope :by_date, -> {order created_at: :desc}
  scope :unread, -> {where read: false}
  def load_message
    case eventable_type
    when Shop.name
      "#{eventable.name} #{eventable_type} #{I18n.t "notification.shop"}
        :#{message.upcase}"
    when Product.name
      "#{eventable.name} #{eventable_type} #{I18n.t "notification.product"}
        :#{message.upcase}"
    when Order.name
      order_shop_event_user
    when OrderProduct.name
      order_product_event
    when User.name
      order_shop_event = Order.find_by id: eventitem_id
      "#{I18n.t "order_of"} #{order_shop_event.user.name}
      #{I18n.t "shop_order_products"}"
    when ShopDomain.name

      shop_event_name_message

      domain = Domain.find_by id: eventable_id
      shop_domain = ShopDomain.find_by id: eventitem_id
      check_message domain, shop_domain
    when UserDomain.name
      check_message_user_domain
    end
  end

  def load_message_time
    case eventable_type
    when Shop.name
      "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
    when Product.name
      "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
    when Order.name
      "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
    when OrderProduct.name
      "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
    when User.name
      "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
    when ShopDomain.name
      "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
    when UserDomain.name
      "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
    end
  end

  def get_link_img
    case eventable_type
    when Shop.name
      eventable.avatar.url
    when Product.name
      eventable.image.url
    when Order.name
      "#{message}.png"
    when OrderProduct.name
      "#{message}.png"
    when User.name
      Settings.image_url.systemdone
    when ShopDomain.name
      Settings.image_url.systemdone
    when UserDomain.name
      user = User.find_by id: eventitem_id
      user.avatar.url
    end
  end

  def get_link_redirect
    case eventable_type
    when Shop.name
      "/dashboard/shops/#{eventable_id}"
    when Product.name
      "/products/#{eventable_id}/##{eventitem_id}"
    when Order.name
      if message == Settings.notification_new
        "/dashboard/shops/#{eventable_id}/orders/##{eventitem_id}"
      else
        "/orders/##{eventitem_id}"
      end
    when OrderProduct.name
      "/orders##{eventitem_id}"
    when User.name
      "/dashboard/shops/#{eventable_id}/order_managers/##{eventitem_id}"
    when ShopDomain.name
      domain = Domain.find_by id: eventable_id
      shop_domain = ShopDomain.find_by id: eventitem_id
      check_message_for_link shop_domain, domain
    when UserDomain.name
      check_link_user_domain
    end
  end

  def send_notification
    EventBroadcastJob.perform_now Event.unread.count, self
  end

  def order_shop_event_user
    if message == Settings.notification_new
      order_shop_event = Order.find_by id: eventitem_id
      if order_shop_event.present?
        "#{I18n.t "order_of"} #{order_shop_event.user.name} #{I18n.t "notification.order"}"
      else
        "#{I18n.t "a_order"} #{I18n.t "order_deleted"}"
      end
    else
      order_shop_event = Order.find_by id: eventable_id
      if order_shop_event.present?
        "#{I18n.t "user_order_products"}"
      else
        "#{I18n.t "deleted_user_order_shop"}"
      end
    end
  end

  def order_product_event
    order = Order.find_by id: eventitem_id
    done_products = order.order_products.done.size
    rejected_products = order.order_products.rejected.size
    "#{I18n.t "order_product"} #{done_products} #{I18n.t "done_products"},
      #{rejected_products} #{I18n.t "rejected_products"}"
  end

  def shop_event_name_message
    if eventable_type == User.name
      order_shop_event = Order.find_by id: eventitem_id
      "#{I18n.t "order_of"} #{order_shop_event.user.name} #{I18n.t "shop_order_products"}"
    end
  end

  def check_message domain, shop_domain
    if shop_domain.present?
      case true
      when shop_domain.pending?
        "#{I18n.t "shop_request"}#{shop_domain.shop.name} #{I18n.t "to_domain"}#{domain.name}"
      when shop_domain.approved?
        if user_id == domain.owner
          "#{I18n.t "owner_active_shop_request"}#{shop_domain.shop.name} #{I18n.t "to_domain"}#{domain.name}"
        else
          "#{I18n.t "active_shop_request"}#{shop_domain.shop.name} #{I18n.t "to_domain"}#{domain.name}"
        end
      else
        "#{I18n.t "blocked_shop_request"}#{domain.name}"
      end
    else
      "#{I18n.t "dada_not_found"}"
    end
  end

  def check_message_for_link shop_domain, domain
    if shop_domain.present?
      case true
      when shop_domain.pending?
        "/shop_domains?domain_id=#{domain.id}"
      when shop_domain.approved?
        if user_id == domain.owner
          "/domains?domain_id=#{eventitem_id}"
        else
          "/domains/#{domain.slug}/dashboard/shops"
        end
      else
        "/domains/#{domain.slug}/dashboard/shops"
      end
    else
      "#"
    end
  end

  def check_link_user_domain
    domain = Domain.find_by id: eventable_id
    user = User.find_by id: eventitem_id
    if user_id == domain.owner
      "/domains?domain_id=#{domain.id}"
    elsif user_id == user.id
      "/domains/#{domain.slug}"
    end
  end

  def check_message_user_domain
    domain = Domain.find_by id: eventable_id
    user = User.find_by id: eventitem_id
    if domain.belong_to? user_id
      "#{user.name}#{I18n.t "request_join_domain"}#{domain.name}"
    elsif user.is_user? user_id
      domain_owner = User.find_by id: domain.owner
      "#{I18n.t "add_join_domain"}#{domain.name}#{I18n.t "by"}#{domain_owner.name}"
    end
  end
end
