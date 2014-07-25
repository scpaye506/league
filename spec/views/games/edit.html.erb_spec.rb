require 'rails_helper'

RSpec.describe "games/edit", :type => :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :league_id => 1
    ))
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input#game_league_id[name=?]", "game[league_id]"
    end
  end
end
