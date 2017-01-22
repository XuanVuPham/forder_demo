module Dashboard::OrderProductsHelper
  def total_price price = 0, quantity = 0
    price * quantity
  end
end
