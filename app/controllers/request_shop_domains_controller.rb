class RequestShopDomainsController < ApplicationController
  before_action :load_request, only: :update
  before_action :load_shop, only: :index
  
  def index
    @user_domains = current_user.domains
  end

  def create
    @request = RequestShopDomain.new request_params
    if @request.save
      flash[:success] = t "flash.success.dashboard.create_request"
    else
      flash[:danger] = t "flash.danger.dashboard.create_request"
    end
    redirect_to request.referrer
  end

  def update
    status = UpdateRequestService.
      new(@request_shop_domain, update_request_params).update
    flash[:success] = status
    redirect_to request.referrer
  end

  private
  def request_params
    params.require(:request_shop_domain).permit :domain_id, :shop_id
  end

  def update_request_params
    params.require(:request_shop_domain).permit :status
  end

  def load_request
    @request_shop_domain = RequestShopDomain.find_by id: params[:id]
    unless @request_shop_domain
      flash[:danger] = t "request_shop.can_not_find_request"
      redirect_to request.referrer
    end
  end

  def load_shop
    @shop = Shop.find_by id: params[:shop_id]
    unless @shop
      flash[:danger] = t "request_shop.can_not_find_shop"
      redirect_to request.referrer
    end
  end
end
