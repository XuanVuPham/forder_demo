require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  subject {FactoryGirl.create(:order_product)}

  context "Associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :order}
    it {is_expected.to belong_to :product}
    it {is_expected.to belong_to :coupon}
  end

  context "Validates" do
    it {is_expected.to be_valid}
  end

  describe "#total_price" do
    it {expect(subject.product.price * subject.quantity).to eq subject.total_price}
  end
end
