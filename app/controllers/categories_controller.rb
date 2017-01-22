class CategoriesController < ApplicationController

  def show
    if Category.exists? params[:id]
      @category = Category.find params[:id]
      @products = if @domain.present?
        @domain.products.by_category @category
      else
        @category.products
      end.active.page(params[:page]).per Settings.common.products_per_page 
    else
      flash[:danger] = t "flash.danger.load_category"
      redirect_to root_path
    end
  end
end
