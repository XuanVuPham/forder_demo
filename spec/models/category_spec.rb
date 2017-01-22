require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category) {FactoryGirl.create(:category)}
  subject {category}

  describe "validates" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    context "validates name" do
      it "is not valid without a name" do
        subject.name = ""
        is_expected.to_not be_valid
      end
      it "validates uniqueness of name" do
        expect(create(:category)).to validate_uniqueness_of(:name)
      end
    end
  end
end
