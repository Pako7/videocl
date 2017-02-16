require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :deleted_at => "Deleted At"
      ),
      User.create!(
        :name => "Name",
        :deleted_at => "Deleted At"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Deleted At".to_s, :count => 2
  end
end
