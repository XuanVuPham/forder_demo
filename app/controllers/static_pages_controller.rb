class StaticPagesController < ApplicationController
  before_action :load_data, only: :home
  layout "index", only: :index
  before_action :check_user_have_domains

  def index
    redirect_to root_path if user_signed_in?
  end
  
  def home
    if user_signed_in?
      load_data_for_user
    else
      redirect_to index_path
    end
  end

  private
  def load_data
    @categories = Category.all
    @tags = ActsAsTaggableOn::Tag.all
    @domains = Domain.professed
  end

  def load_data_for_user
    if current_user.domains.present?
      redirect_to domain_path(current_user.domains.first)
    else
      @shops = Shop.top_shops.decorate
      @products = Product.top_products
    end
  end
end
