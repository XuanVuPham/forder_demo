class EditCartsController < ApplicationController
  before_action :load_shop

  def index
    @cart_shop = load_cart_shop @shop
    @cart_shop.items.each_with_index do |cart, index|
      product = Product.find_by id: cart.product_id
      if Time.now.is_between_short_time?(product.start_hour, product.end_hour)
         delete_item = @cart.items.find{|item| item.product_id == product.id.to_s}
         @cart.items.delete delete_item
         @cart_domain.add_cart @cart.sort, session[:domain_id]
         session[:cart_domain] = @cart_domain.update_cart
      end
    end
    redirect_to new_domain_order_path(@domain, shop_id: @shop.id)
  end

  private
  def load_shop
    @shop = Shop.find_by id: params[:shop_id]
    unless @shop
      flash[:danger] = t "flash.danger.load_shop"
      redirect_to products_path
    end
  end
end
