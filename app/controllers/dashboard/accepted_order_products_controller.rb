class Dashboard::AcceptedOrderProductsController < ApplicationController
  before_action :load_shop_order, only: :index

  def index
    @accepted_order_products = @shop.order_products.order_products_accepted
    respond_to do |format|
      format.json do
        render json: @accepted_order_products
      end
    end
  end

  private
  def load_shop_order
    @shop = Shop.find_by id: params[:shop_id]
  end
end
