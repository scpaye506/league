require "rails_helper"

RSpec.describe DgLeaguesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dg_leagues").to route_to("dg_leagues#index")
    end

    it "routes to #new" do
      expect(:get => "/dg_leagues/new").to route_to("dg_leagues#new")
    end

    it "routes to #show" do
      expect(:get => "/dg_leagues/1").to route_to("dg_leagues#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dg_leagues/1/edit").to route_to("dg_leagues#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dg_leagues").to route_to("dg_leagues#create")
    end

    it "routes to #update" do
      expect(:put => "/dg_leagues/1").to route_to("dg_leagues#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dg_leagues/1").to route_to("dg_leagues#destroy", :id => "1")
    end

  end
end
