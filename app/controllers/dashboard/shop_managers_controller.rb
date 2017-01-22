class Dashboard::ShopManagersController < BaseDashboardController
  before_action :load_shop
  before_action :load_shop_manager, only: :destroy
  before_action :check_user_status_for_action

  def index
    @managers = @shop.users
    q = params[:search]
    if q
      @users = User.search(name_or_email_cont: q).result
      respond_to do |format|
        format.js
      end
    end
  end

  def create
    @shop_manager = @shop.shop_managers.new shop_manager_params
    if @shop_manager.save
      flash[:success] = t "flash.success_message"
    else
      flash[:danger] = t "flash.danger_message"
    end
    redirect_to dashboard_shop_shop_managers_path @shop
  end

  def destroy
    if @shop_manager.destroy
      flash[:success] = t "flash.success_message"
    else
      flash[:danger] = t "flash.danger_message"
    end
    redirect_to dashboard_shop_shop_managers_path @shop
  end

  private
  def load_shop
    if Shop.exists? params[:shop_id]
      @shop = Shop.find params[:shop_id]
      unless @shop.is_owner? current_user
        flash[:danger] = t "flash.danger.load_shop"
        redirect_to dashboard_shops_path
      end
    else
      flash[:danger] = t "flash.danger.load_shop"
      redirect_to dashboard_shops_path
    end
  end

  def shop_manager_params
    params.require(:shop_manager).permit :user_id
  end

  def load_shop_manager
    @shop_manager = ShopManager.find_by id: params[:id]
    unless @shop_manager
      flash[:danger] = t "flash.danger.load_shop"
      redirect_to dashboard_shop_shop_managers_path @shop
    end
  end
end
