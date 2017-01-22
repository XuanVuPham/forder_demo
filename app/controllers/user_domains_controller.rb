class UserDomainsController < ApplicationController
  before_action :load_data
  before_action :load_domain_by_param

  def new
    unless @choosen_domain
      flash[:danger] = t "can_not_load_domain"
      redirect_to :back
    end
    @users = User.by_active.page(params[:page]).per Settings.common.per_page
  end

  def create
    if @user
      user_domain = UserDomain.new user_id: @user.id, domain_id: @choosen_domain.id
      save_user_domain user_domain
    else
      flash[:danger] = t "can_not_find_user"
    end
    redirect_to :back
  end

  def destroy
    UserDomain.destroy_all domain_id: @choosen_domain.id, user_id: @user.id
    flash[:success] = t "delete_domain"
    redirect_to :back
  end

  private
  def load_data
    if params[:user_id]
      @user = User.find_by id: params[:user_id]
    elsif params[:email]
      @user = User.find_by email: params[:email]
    end
    return unless @user
    @products = @user.products
    @shops = @user.shops
  end

  def save_user_domain user_domain
    if user_domain.save
      flash[:success] = t "add_domain"
    else
      flash[:danger] = t "can_not_add_account"
    end
  end
end
