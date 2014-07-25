require 'rails_helper'

RSpec.describe "players/edit", :type => :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :gender => "MyString",
      :classification => "MyString"
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input#player_first_name[name=?]", "player[first_name]"

      assert_select "input#player_last_name[name=?]", "player[last_name]"

      assert_select "input#player_middle_name[name=?]", "player[middle_name]"

      assert_select "input#player_gender[name=?]", "player[gender]"

      assert_select "input#player_classification[name=?]", "player[classification]"
    end
  end
end
