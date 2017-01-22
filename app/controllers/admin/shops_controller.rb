class Admin::ShopsController < AdminController
  load_and_authorize_resource

  def index
    @shops = @shops.decorate
  end

  def update
    if @shop.update_attributes shop_params
      flash[:success] = t "flash.success_message"
    else
      flash[:danger] = t "flash.danger_message"
    end
    redirect_to admin_shops_path
  end

  def destroy
    if @shop.destroy
      flash[:success] = t "flash.success_message"
    else
      flash[:danger] = t "flash.danger_message"
    end
    redirect_to admin_shops_path
  end

  private
  def shop_params
    params.require(:shop).permit :status
  end
end
