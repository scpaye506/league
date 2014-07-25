require 'rails_helper'

RSpec.describe "dg_leagues/edit", :type => :view do
  before(:each) do
    @dg_league = assign(:dg_league, DgLeague.create!(
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :name => "MyString",
      :description => "MyText",
      :par => 1
    ))
  end

  it "renders the edit dg_league form" do
    render

    assert_select "form[action=?][method=?]", dg_league_path(@dg_league), "post" do

      assert_select "input#dg_league_address1[name=?]", "dg_league[address1]"

      assert_select "input#dg_league_address2[name=?]", "dg_league[address2]"

      assert_select "input#dg_league_city[name=?]", "dg_league[city]"

      assert_select "input#dg_league_state[name=?]", "dg_league[state]"

      assert_select "input#dg_league_zip[name=?]", "dg_league[zip]"

      assert_select "input#dg_league_name[name=?]", "dg_league[name]"

      assert_select "textarea#dg_league_description[name=?]", "dg_league[description]"

      assert_select "input#dg_league_par[name=?]", "dg_league[par]"
    end
  end
end
