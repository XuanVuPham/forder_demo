class Admin::ProductsController < AdminController
  load_and_authorize_resource

  def index
    @products = Product.all.page(params[:page]).per Settings.common.per_page
  end
end
