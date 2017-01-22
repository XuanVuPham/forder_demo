require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  context "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #new" do
    let!(:product) {FactoryGirl.create(:product)}
    it "should render new" do
      get :new, id: product.id
      expect(response).to render_template "new"
    end
  end

  context "GET show" do
    let!(:product) {FactoryGirl.create(:product)}
    it "should be param" do
      get :show, id: product.id
      expect(product).to be
    end
    it "should not be param" do
      product.destroy
      get :show, id: product.id
      expect(response).to redirect_to(products_path)
    end
  end
end
