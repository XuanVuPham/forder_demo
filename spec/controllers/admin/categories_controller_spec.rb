require "rails_helper"

RSpec.describe Admin::CategoriesController , type: :controller do
  let(:category) do
    mock_model Category, name: "category"
  end

  before do
    admin = FactoryGirl.create :admin
    sign_in admin
  end

  describe "GET #index" do
    it "should index all category" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #new" do
    it "should created category" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "POST #create" do
    it "created category" do
      post :create, category: {name: "category"}
      response.should redirect_to admin_categories_path
    end

    it "don't created category" do
      post :create, category: {name: nil}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "should render edit" do
      get :edit, id: category.id
      expect(response).to render_template "edit"
    end
  end

  describe "PATCH #update" do
    it "should update category" do
      patch :update, id: category.id, category: {name: "category2"}
      expect(response).to redirect_to admin_categories_path
    end

    it "don't update category" do
      patch :update, id: category.id, category: {name: ""}
      expect(response).to render_template "edit"
    end
  end

  describe "DELETE #destroy" do
    it "deleted category" do
      delete :destroy, {id: category}
      expect(flash[:success]).not_to be_empty
    end

    it "don't deleted category" do
      delete :destroy, {id: 0}
      expect(flash[:danger]).not_to be_empty
    end
  end
end
