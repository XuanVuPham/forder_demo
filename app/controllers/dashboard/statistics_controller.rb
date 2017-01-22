class Dashboard::StatisticsController < ApplicationController
  before_action :check_user_status_for_action
  before_action :load_domain

  def index
    @shops = current_user.shops
    @current_user_shops = current_user.shops.by_shop params[:current_shop_id]
    @user_shops = current_user.shops.by_shop params[:shop_id]
    @data_chart_currents = Order.build_data_chart @current_user_shops,
      params[:category_statistic]
    @data_chart_betweens = Order.build_data_between_date @user_shops,
      params[:start_date], params[:end_date]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
