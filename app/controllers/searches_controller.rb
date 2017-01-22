class SearchesController < ApplicationController
  def index
    q = params[:search]
    products = Product.in_domain(@domain.id).active.search(name_or_description_cont: q).result
      .includes :shop
    shops = Shop.shop_in_domain(@domain.id).search(name_or_description_or_owner_name_cont: q).result
      .includes(:owner).decorate
    @items = products + shops
    respond_to do |format|
      format.js
      format.html
    end
  end
end
