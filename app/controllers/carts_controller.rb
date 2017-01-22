class CartsController < ApplicationController
  before_action :authenticate_user!, except: [:update, :index]
  before_action :load_product, only: :update
  before_action :check_before_order, only: [:new, :index]
  before_action :check_user_status_for_action, except: [:update, :index]

  def index
    if @cart.blank?
      flash[:danger] = t "cart.not_product"
    end
  end

  def update
    @cart.add_item params[:id], @product.shop.id
    update_session
  end

  def new
    @have_order_deleted = t("oder.has_order_deleted") + @count_exit_order.to_s + t("oder.product_deleted")
    @all_order_deleted = t("oder.all_product_will_be_order")
  end

  def create 
    @order_delete_num = Settings.start_count_order
    @count_exit_order = Settings.start_count_order
    @cart_group.each do |cart_group|
      shop = Shop.find_by id: cart_group[:shop_id]
      cart_shop = load_cart_shop shop
      if cart_shop.present?
        order = Order.new params_create_order cart_shop, shop
        if order.save
          delete_cart_after_save cart_shop, shop, order
        else
          flash[:danger] = t "oder.not_oder"
          redirect_to new_order_path
        end
      else
        flash[:danger] = t "oder.not_product_in_cart"
        redirect_to carts_path
      end
    end   
    @cart_domain.carts.delete @cart
    @cart = Cart.new session[:domain_id] 
    session[:cart_domain] = @cart_domain.update_cart 
    checkout_order @order_delete_num, @count_exit_order
  end

  def edit
    item = @cart.find_item params[:id]
    if item.quantity > 1
      item.decrement
      update_session
      respond_to do |format|
        format.js {render :update}
      end
    end
  end

  def destroy
    item = @cart.items.find{|item| item.product_id == params[:id]}
    if item
      @cart.items.delete item
      update_session
    end
    respond_to do |format|
      format.js {render :update}
    end
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "flash.danger.load_product"
      redirect_to root_path
    end
  end

  def check_order order, cart_shop
    if order.products.size == Settings.start_count_order
      order.destroy
      Settings.start_count_order
    elsif cart_shop.items.size > order.products.size
      Settings.order_increase
    else
      Settings.check_order
    end
  end

  def check_before_order
    @cart_group_price = Settings.start_count_order
    @count_exit_order = Settings.start_count_order
    @products_deleted = []
    @cart_group.each do |cart_group|
      cart_group[:items].each do |cart|
        product = Product.find_by id: cart.product_id.to_i
        @cart_group_price += total_price product.price, cart.quantity
        if Time.now.is_between_short_time?(product.start_hour, product.end_hour)
          @count_exit_order += Settings.order_increase
          @products_deleted << product
        end
      end
    end
  end

  def checkout_order recheck, count_exit_order
    if recheck == Settings.start_count_order
      flash[:danger] = t "oder.allthing_deleted"
      redirect_to domain_path @domain
    elsif count_exit_order > Settings.start_count_order
      flash[:warning] = t("oder.has_order_deleted") + count_exit_order.to_s + t("oder.product_deleted")
      redirect_to domain_orders_path @domain
    else
      flash[:success] = t "oder.success"
      redirect_to domain_orders_path @domain
    end
  end

  def delete_cart_after_save cart_shop, shop, order
    @order_delete_num += check_order order, cart_shop
    if check_order(order, cart_shop) == Settings.order_increase
      @count_exit_order += cart_shop.items.size - order.products.size
    end
  end

  def update_session
    @cart_domain.add_cart @cart.sort, session[:domain_id]
    session[:cart_domain] = @cart_domain.update_cart
  end
end
