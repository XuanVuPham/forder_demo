class Admin::UsersController < AdminController
  load_and_authorize_resource
  before_action :load_user, only: [:update, :destroy]

  def index
    @users = User.all.page(params[:page]).per Settings.common.per_page
      respond_to do |format|
      format.html
      format.xls
    end
  end

  def edit
  end

  def create
    @user = User.new newuser_params
    if @user.save
      flash[:success] = t "flash.success.admin.created_user"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    if params[:status].present?
      @user.update_columns status: params[:status]
      redirect_to :back
    else
      if @user.update_attributes user_params
        flash[:success] = t "flash.success.admin.updated_user"
        respond_to do |format|
          format.json do
            render json: {status: @user.status}
          end
          format.html {redirect_to admin_users_path}
        end
      else
        flash[:danger] = t "flash.danger.admin.updated_user"
        render :edit
      end
    end
  end

  def destroy
    if @user.shop_managers.present?
      flash[:danger] = t "flash.danger.admin.existing_users_shops"
    else
      if @user.destroy
        flash[:success] = t "flash.success.admin.deleted_user"
      else
        flash[:danger] = t "flash.danger.admin.deleted_user"
      end
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :chatwork_id, :avatar,
    :description, :status
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      redirect_to :back
    end
  end

  def newuser_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
