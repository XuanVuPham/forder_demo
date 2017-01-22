require "rails_helper"

RSpec.describe "dashboard/shops/edit.html.erb", type: :view do
  let(:shop) do
    mock_model Shop, name: "user", description: "description", status: 1
  end

  it "should edit shops" do
    assign :shop, shop
    render
    expect(rendered).to include(shop.name)
    expect(rendered).to include(shop.description)
    expect(rendered).to include(shop.avatar.to_s)
    expect(rendered).to include(shop.cover_image.to_s)
  end
end
