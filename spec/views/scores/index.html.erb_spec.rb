require 'rails_helper'

RSpec.describe "scores/index", :type => :view do
  before(:each) do
    assign(:scores, [
      Score.create!(
        :value => 1,
        :player_id => 2,
        :game_id => 3
      ),
      Score.create!(
        :value => 1,
        :player_id => 2,
        :game_id => 3
      )
    ])
  end

  it "renders a list of scores" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
