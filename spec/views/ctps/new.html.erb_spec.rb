require 'rails_helper'

RSpec.describe "ctps/new", :type => :view do
  before(:each) do
    assign(:ctp, Ctp.new(
      :hole => 1,
      :player_id => 1,
      :game_id => 1
    ))
  end

  it "renders new ctp form" do
    render

    assert_select "form[action=?][method=?]", ctps_path, "post" do

      assert_select "input#ctp_hole[name=?]", "ctp[hole]"

      assert_select "input#ctp_player_id[name=?]", "ctp[player_id]"

      assert_select "input#ctp_game_id[name=?]", "ctp[game_id]"
    end
  end
end
