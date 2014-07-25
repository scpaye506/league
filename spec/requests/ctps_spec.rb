require 'rails_helper'

RSpec.describe "Ctps", :type => :request do
  describe "GET /ctps" do
    it "works! (now write some real specs)" do
      get ctps_path
      expect(response.status).to be(200)
    end
  end
end
