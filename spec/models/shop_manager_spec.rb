require "rails_helper"

RSpec.describe ShopManager, type: :model do
  let(:shop_manager) {FactoryGirl.create(:shop_manager)}

  context "Associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :shop}
  end
end
