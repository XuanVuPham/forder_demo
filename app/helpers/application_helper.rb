module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "common.base_title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def admin_full_title page_title
    base_title = I18n.t "common.admin_title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def increase_one index
    index + Settings.order_increase
  end

  def compare_time_order start_hour, end_hour
    start_hour < end_hour
  end

  def paginate objects, options = {}
    options.reverse_merge! theme: "twitter-bootstrap-3"
    super objects, options
  end

  def count_notification_unread
    if user_signed_in?
      number_noti =  @count_unread_notification
      if number_noti == Settings.notification.number_unread_not_display
        number_noti = ""
      else
        number_noti
      end
    end
  end

  def total_price price, quantity
    price * quantity
  end

  def format_price price
    number_with_delimiter(price.to_i).to_s + t("cart.vnd")
  end

  def bg_unread event
    if event.read == false
      "unread"
    end
  end

  def detail_price cart
    @cart_price = 0
    cart.each do |item|
      @cart_price += item.total_price
    end
    @cart_price
  end

  def selected_lang
    session[:locale]
  end

  def check_domain_status domain
    domain.professed?
  end

  def select_lang
    case selected_lang.to_s
    when Settings.languages.vietnamese.type
      Settings.languages.vietnamese.image
    when Settings.languages.japanese.type
      Settings.languages.japanese.image
    else
      Settings.languages.english.image
    end
  end

  def number_product_in_category_by_domain category, domain
    products = if @domain.present?
      domain.products.by_category category
    else
      category.products
    end
    products.size
  end

  def domain_icon domain
    domain.professed? ? Settings.domain.professed : Settings.domain.secret
  end
end
