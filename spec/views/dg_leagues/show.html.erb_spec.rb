require 'rails_helper'

RSpec.describe "dg_leagues/show", :type => :view do
  before(:each) do
    @dg_league = assign(:dg_league, DgLeague.create!(
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :zip => "Zip",
      :name => "Name",
      :description => "MyText",
      :par => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
