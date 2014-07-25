require 'rails_helper'

RSpec.describe "scores/edit", :type => :view do
  before(:each) do
    @score = assign(:score, Score.create!(
      :value => 1,
      :player_id => 1,
      :game_id => 1
    ))
  end

  it "renders the edit score form" do
    render

    assert_select "form[action=?][method=?]", score_path(@score), "post" do

      assert_select "input#score_value[name=?]", "score[value]"

      assert_select "input#score_player_id[name=?]", "score[player_id]"

      assert_select "input#score_game_id[name=?]", "score[game_id]"
    end
  end
end
