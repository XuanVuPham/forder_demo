module Dashboard::OrdersHelper
  def status_order order
    case
    when order.accepted?
      change_status order, "label-warning"
    when order.rejected?
      change_status order, "label-danger"
    when order.done?
      change_status order, "label-success"
    else
      change_status order, "label-info"
    end
  end

  def status_order_product order_product
    case
    when order_product.accepted?
      change_status order_product, "label-warning"
    when order_product.rejected?
      change_status order_product, "label-danger"
    when order_product.done?
      change_status order_product, "label-success"
    else
      change_status order_product, "label-info"
    end
  end

  def change_status order, label_class
    content_tag :span, order.status, class: "label #{label_class}"
  end

  def option_status status, order
    content_tag(:option, value: dashboard_shop_order_path(@shop.id, order,
      order: {status: status}),
      selected: check_status?(status, order.status)) do
      status
    end
  end

  def option_status_items status, item
    content_tag(:option, value: dashboard_shop_order_product_path(@shop.id, item.id,
      order_product: {status: status}),
      selected: check_status?(status, item.status)) do
      status
    end
  end

  def check_status? status, confirm_order
    status == confirm_order
  end
end
