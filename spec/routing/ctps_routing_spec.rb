require "rails_helper"

RSpec.describe CtpsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ctps").to route_to("ctps#index")
    end

    it "routes to #new" do
      expect(:get => "/ctps/new").to route_to("ctps#new")
    end

    it "routes to #show" do
      expect(:get => "/ctps/1").to route_to("ctps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ctps/1/edit").to route_to("ctps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ctps").to route_to("ctps#create")
    end

    it "routes to #update" do
      expect(:put => "/ctps/1").to route_to("ctps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ctps/1").to route_to("ctps#destroy", :id => "1")
    end

  end
end
