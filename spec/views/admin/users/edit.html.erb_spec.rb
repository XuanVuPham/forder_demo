require "rails_helper"

RSpec.describe "admin/users/edit.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  it "displays user correctly" do
    assign :user, user
    render
    expect(rendered).to include(user.name)
    expect(rendered).to include(user.email)
    expect(rendered).to include(user.chatwork_id)
    expect(rendered).to include(user.description)
  end
end
