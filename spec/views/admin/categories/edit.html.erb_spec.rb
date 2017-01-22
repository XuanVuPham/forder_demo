require "rails_helper"

RSpec.describe "admin/categories/edit.html.erb", type: :view do
  let(:category) {FactoryGirl.create(:category)}

  it "displays category correctly" do
    assign :category, category
    render
    expect(rendered).to include(category.name)
  end
end
