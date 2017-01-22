class Admin::SetUserController < ApplicationController
  def create
    import_user = SetUserService.new(params[:file]).import
    flash[:success] = import_user
    redirect_to admin_users_path
  end
end
