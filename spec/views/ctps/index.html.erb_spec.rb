require 'rails_helper'

RSpec.describe "ctps/index", :type => :view do
  before(:each) do
    assign(:ctps, [
      Ctp.create!(
        :hole => 1,
        :player_id => 2,
        :game_id => 3
      ),
      Ctp.create!(
        :hole => 1,
        :player_id => 2,
        :game_id => 3
      )
    ])
  end

  it "renders a list of ctps" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
