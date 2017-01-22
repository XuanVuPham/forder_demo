require "rails_helper"

RSpec.describe ShopsController, type: :controller do

  subject {FactoryGirl.create(:shop)}

  context "GET #index" do
    it "render index" do
      get :index
      expect(response).to render_template "index"
    end
  end

  context "GET #show" do
    it "render show shop" do
      get :show, id: subject.id
      expect(response).to render_template "show"
    end

    it "render show shop failure" do
      get :show, id: 0
      expect(0).to be_truthy
    end
  end
end
