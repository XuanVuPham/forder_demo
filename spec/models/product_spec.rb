require "rails_helper"

RSpec.describe Product, type: :model do
   let(:product) {FactoryGirl.create(:product)}
   subject {product}

  context "scope" do
    it {expect(Product.top_products).to eq([subject])}
  end

  context "Associations" do
    it {is_expected.to belong_to :category}
    it {is_expected.to belong_to :shop}
    it {is_expected.to belong_to :user}
  end

  describe "validates" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    context "validates name" do
      before {subject.name = ""}
      it "is not valid without a name" do
        is_expected.to_not be_valid
      end
    end
    context "validates description" do
      before {subject.description = ""}
      it "is not valid without a description" do
        is_expected.to_not be_valid
      end
    end
  end
end
