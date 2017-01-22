require "rails_helper"

RSpec.describe Admin::ShopsController, type: :controller do

  let(:shop) {FactoryGirl.create :shop}

  before do
    admin = FactoryGirl.create :admin
    sign_in admin
  end

  describe "GET #index" do
    it "load shops success" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "PATCH #update" do
    it "updated category" do
      patch :update, id: shop.id, shop: {status: "closed"}
      expect(response).to redirect_to admin_shops_path
      expect(flash[:success]).not_to be_empty
    end

    it "don't update shop" do
      patch :update, id: shop, shop: {status: "value-error"}
      expect(response).to redirect_to admin_shops_path
      expect(flash[:danger]).not_to be_empty
    end
  end

  describe "DELETE #destroy" do
    it "deleted shop" do
      delete :destroy, id:shop.id
      expect(shop.deleted_at).to_not be_nil
      expect(flash[:success]).not_to be_empty
    end

    it "don't delete shop" do
      shop.destroy
      expect do
        delete :destroy, id: shop.id
      end.to raise_exception ActiveRecord::RecordNotFound
      expect(flash[:danger]).not_to be_empty
    end
  end
end
