require "rails_helper"

RSpec.describe "admin/users/index.html.erb", type: :view do
  let(:admin) {FactoryGirl.create(:admin)}
  let(:user) {FactoryGirl.create(:user)}

  it "should display list user" do
    assign :users, [user]
    render
    expect(rendered).to include(user.name)
    expect(rendered).to include(user.email)
    expect(rendered).to include(user.description)
    expect(rendered).to include(user.status)
  end
end
