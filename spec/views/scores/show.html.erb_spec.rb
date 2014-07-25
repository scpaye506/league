require 'rails_helper'

RSpec.describe "scores/show", :type => :view do
  before(:each) do
    @score = assign(:score, Score.create!(
      :value => 1,
      :player_id => 2,
      :game_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
