require "rails_helper"

RSpec.describe LinesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lines").to route_to("lines#index")
    end

    it "routes to #new" do
      expect(:get => "/lines/new").to route_to("lines#new")
    end

    it "routes to #show" do
      expect(:get => "/lines/cunard-line").to route_to("lines#show", :id => "cunard-line")
    end

    it "routes to #edit" do
      expect(:get => "/lines/cunard-line/edit").to route_to("lines#edit", :id => "cunard-line")
    end

    it "routes to #create" do
      expect(:post => "/lines").to route_to("lines#create")
    end

    it "routes to #update" do
      expect(:put => "/lines/cunard-line").to route_to("lines#update", :id => "cunard-line")
    end

    it "routes to #destroy" do
      expect(:delete => "/lines/cunard-line").to route_to("lines#destroy", :id => "cunard-line")
    end

  end
end
