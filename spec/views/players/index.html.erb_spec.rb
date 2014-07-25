require 'rails_helper'

RSpec.describe "players/index", :type => :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :gender => "Gender",
        :classification => "Classification"
      ),
      Player.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :gender => "Gender",
        :classification => "Classification"
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Classification".to_s, :count => 2
  end
end
