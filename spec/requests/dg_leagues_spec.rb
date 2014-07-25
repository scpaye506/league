require 'rails_helper'

RSpec.describe "DgLeagues", :type => :request do
  describe "GET /dg_leagues" do
    it "works! (now write some real specs)" do
      get dg_leagues_path
      expect(response.status).to be(200)
    end
  end
end
