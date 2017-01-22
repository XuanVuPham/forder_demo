class Admin::OrdersController < AdminController
  load_and_authorize_resource

  def index
    @orders = @orders.page(params[:page]).per Settings.common.per_page
  end

  def show
  end

  def destroy
  end
end
