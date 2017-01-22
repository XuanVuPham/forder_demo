class Dashboard::ProductsController < BaseDashboardController
  before_action :load_shop
  before_action :load_categories, only: [:edit, :new, :update]
  before_action :load_product, except: [:index, :new, :create]
  before_action :load_products, only: :index
  before_action :load_domain, only: [:new, :edit, :destroy]

  def new
    @product = @shop.products.new
  end

  def index
    @products.page(params[:page]).per Settings.common.products_per_page
  end

  def show
    @order_item = OrderProduct.find_by id: params[:order_product_id]
    if @order_item
      case
      when @order_item.done?
        @order_products = @product.order_products.done
      when @order_item.rejected?
        @order_products = @product.order_products.rejected
      else
        @order_products = @product.order_products.accepted
      end
    else
      flash[:danger] = t "flash.danger.dashboard.product.not_found"
      redirect_to dashboard_shop_products_path
    end
  end

  def edit
  end

  def create
    @domain = Domain.find_by id: params[:product][:domain_id]
    @product = @shop.products.new product_params
    if @product.save
      @domains = @shop.domains
      if @domains.present?
        @domains.each do |domain|
          if check_shop_of_domain? domain
            save_product_domain domain
          end
        end
        redirect_to domain_dashboard_shop_path(@domain, @shop)
      else
        flash[:success] = t "flash.success.dashboard.create_product"
        redirect_to dashboard_shop_path(@shop, domain_id: Settings.not_find)
      end
    else
      flash[:danger] = t "flash.danger.dashboard.create_product"
      load_categories
      render :new
    end
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "flash.success.dashboard.edit_product"
      respond_to do |format|
        format.json do
          render json: {status: @product.status}
        end
        format.html do
          if check_domain_present?
            redirect_to domain_dashboard_shop_path @domain, @shop
          else
            redirect_to dashboard_shop_path(@shop, domain_id: Settings.not_find)
          end
        end
      end
    else
      flash[:danger] = t "flash.danger.dashboard.edit_product"
      render :edit
    end
  end

  def destroy
    if @product.order_products.any?
      flash[:danger] = t "flash.danger.dashboard.order_product"
    elsif @product.destroy
      flash[:success] = t "flash.success.dashboard.delete_product"
    else
      flash[:danger] = t "flash.danger.dashboard.delete_product"
    end
    if @domain.present?
      redirect_to domain_dashboard_shop_path @domain, @shop
    else
      redirect_to dashboard_shop_path(@shop, domain_id: Settings.not_find)
    end
  end

  private
  def load_shop
    if Shop.exists? params[:shop_id]
      @shop = Shop.find params[:shop_id]
    else
      flash[:danger] = t "flash.danger.load_shop"
      redirect_to dashboard_shop_path
    end
  end

  def product_params
    params.require(:product).permit :id, :name, :description, :price,
      :category_id, :user_id, :image, :status, :tag_list, :start_hour, :end_hour
  end

  def load_categories
    @categories = Category.all
  end

  def load_product
    if Product.exists? params[:id]
      @product = @shop.products.find params[:id]
    else
      flash[:danger] = t "flash.danger.dashboard.product.not_found"
      redirect_to dashboard_shop_products_path
    end
  end

  def load_products
    @products = @shop.products
  end

  def check_domain_present?
    @domain = Domain.find_by id: params[:product][:domain_id]
    @domain.present?
  end

  def check_shop_of_domain? domain
    shop_domain = ShopDomain.find_by shop_id: @shop.id, domain_id: domain.id
    shop_domain.active?
  end

  def save_product_domain domain
    product_domain = ProductDomain.new product_id: @product.id,
      domain_id: domain.id
    unless product_domain.save
      flash[:danger] = t "flash.danger.dashboard.add_product_failed"
      redirect_to :back
    end
  end
end
