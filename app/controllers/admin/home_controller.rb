class Admin::HomeController < AdminController
  def index
    @users = User.by_date_newest
      .take Settings.admin.dashboard.max_items
    @shops = Shop.by_date_newest
      .take Settings.admin.dashboard.max_items
    @products = Product.by_date_newest
      .take Settings.admin.dashboard.max_items
  end
end
