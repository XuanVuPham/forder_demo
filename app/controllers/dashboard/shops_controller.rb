class Dashboard::ShopsController < BaseDashboardController
  before_action :load_shop, only: [:show, :edit, :update]
  before_action :load_params_update, only: :show
  before_action :check_user_status_for_action
  before_action :load_domain_in_session

  def new
    @shop = current_user.own_shops.build
  end

  def create
    @shop = current_user.own_shops.build shop_params
    if @shop.save
      if check_domain_present?
        save_shop_domain
      else
        redirect_to dashboard_shops_path
      end
    else
      flash[:danger] = t "flash.danger.dashboard.updated_shop"
      render :new
    end
  end

  def show
    @user = User.find_by id: @shop.owner_id
    @shop = @shop.decorate
    @products = @shop.products.page(params[:page])
      .per Settings.common.products_per_page
    if @start_hour.present? and @end_hour.present?
      if compare_time_order @start_hour, @end_hour
        @products.update_all status: :active, start_hour: @start_hour,
          end_hour: @end_hour
        flash.now[:success] = t "dashboard.shops.show.update_success"
      else
        flash.now[:danger] = t "dashboard.shops.show.update_faild"
      end
    end
  end

  def index
    @request = @domain.request_shop_domains.build if @domain.present?
    @shops = current_user.own_shops.page(params[:page]).per(Settings.common.per_page).decorate
  end

  def edit
  end

  def update
    if !params[:shop].present?
      flash[:danger] = t "choose_picture"
      redirect_to dashboard_shop_path
    else
      if @shop.update_attributes shop_params
        flash[:success] = t "flash.success.dashboard.updated_shop"
        redirect_by_domain
      else
        flash[:danger] = t "flash.danger.dashboard.updated_shop"
        render :edit
      end
    end
  end

  private
  def shop_params
    params.require(:shop).permit :id, :name, :description,
      :cover_image, :avatar, :time_auto_reject
  end

  def load_params_update
    @start_hour = params[:start_hour]
    @end_hour = params[:end_hour]
  end

  def load_shop
    if Shop.exists? params[:id]
      @shop = Shop.find params[:id]
    else
      flash[:danger] = t "flash.danger.load_shop"
      redirect_to root_path
    end
  end

  def check_domain_present?
    @domain = Domain.find_by id: params[:shop][:domain_id]
    @domain.present?
  end

  def save_shop_domain
    shop_domain = if @domain.owner == current_user.id
      ShopDomain.new shop_id: @shop.id, domain_id: @domain.id,
        status: :approved
    else
      ShopDomain.new shop_id: @shop.id, domain_id: @domain.id,
        status: :pending
    end
    if shop_domain.save
      flash[:success] = t "flash.success.dashboard.updated_shop"
      check_status_notification shop_domain
    else
      flash[:danger] = t "flash.danger.dashboard.updated_shop"
    end
    redirect_to domain_dashboard_shops_path @domain
  end

  def redirect_by_domain
    if check_domain_present?
      redirect_to dashboard_shop_path(@shop, domain_id: @domain.id)
    else
      redirect_to dashboard_shop_path(@shop, domain_id: Settings.not_find)
    end
  end

  def check_status_notification shop_domain
    if shop_domain.pending?
      shop_domain.create_event_request_shop @domain.owner, shop_domain
    elsif shop_domain.approved?
      shop_domain.create_event_request_shop shop_domain.shop.owner_id.id,
        shop_domain
    end
  end
end
