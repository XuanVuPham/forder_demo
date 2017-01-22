class TagsController < ApplicationController
  def show
    if ActsAsTaggableOn::Tag.friendly.exists? params[:id]
      @tag = ActsAsTaggableOn::Tag.friendly.find params[:id]
      @products = Product.active.tagged_with(@tag.name).page(params[:page])
        .per Settings.common.products_per_page
    else
      flash[:danger] = t "flash.danger_message"
      redirect_to root_path
    end
  end
end
