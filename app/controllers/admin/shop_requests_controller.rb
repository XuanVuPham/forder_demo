class Admin::ShopRequestsController < AdminController
  load_and_authorize_resource class: "Shop"

  def index
    @shops = Shop.pending.page(params[:page]).per(Settings.common.per_page)
  end

  def update
    if @shop_request.update_attributes(shop_request_params)
      respond_to do |format|
        format.json do
          render json: {
            is_success: true,
            message: t("admin.shop_requests.index.update_shop_request_success",
              shop: @shop_request.name, status: @shop_request.status)
          }
        end
      end
    else
      respond_to do |format|
        format.json do
          render json: {
            is_success: false,
            message: t("admin.shop_requests.index.update_shop_request_failed",
              shop: @shop_request.name, status: @shop_request.status)
          }
        end
      end
    end
  end

  private
  def shop_request_params
    params[:shop_request][:status] = params[:shop_request][:status].to_i
    params.require(:shop_request).permit :status
  end
end
