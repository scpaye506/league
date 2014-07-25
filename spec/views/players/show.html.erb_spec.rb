require 'rails_helper'

RSpec.describe "players/show", :type => :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :middle_name => "Middle Name",
      :gender => "Gender",
      :classification => "Classification"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Classification/)
  end
end
