require 'rails_helper'

RSpec.describe "ctps/edit", :type => :view do
  before(:each) do
    @ctp = assign(:ctp, Ctp.create!(
      :hole => 1,
      :player_id => 1,
      :game_id => 1
    ))
  end

  it "renders the edit ctp form" do
    render

    assert_select "form[action=?][method=?]", ctp_path(@ctp), "post" do

      assert_select "input#ctp_hole[name=?]", "ctp[hole]"

      assert_select "input#ctp_player_id[name=?]", "ctp[player_id]"

      assert_select "input#ctp_game_id[name=?]", "ctp[game_id]"
    end
  end
end
