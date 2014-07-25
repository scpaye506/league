require 'rails_helper'

RSpec.describe "dg_leagues/index", :type => :view do
  before(:each) do
    assign(:dg_leagues, [
      DgLeague.create!(
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :name => "Name",
        :description => "MyText",
        :par => 1
      ),
      DgLeague.create!(
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :name => "Name",
        :description => "MyText",
        :par => 1
      )
    ])
  end

  it "renders a list of dg_leagues" do
    render
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
