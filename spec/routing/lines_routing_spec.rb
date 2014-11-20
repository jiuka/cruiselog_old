require "rails_helper"

RSpec.describe LinesController, :type => :routing do
  describe "routing en" do

    it "routes to #index" do
      expect(:get => "/lines").to route_to("lines#index", :locale => "en")
    end

    it "routes to #new" do
      expect(:get => "/lines/new").to route_to("lines#new", :locale => "en")
    end

    it "routes to #show" do
      expect(:get => "/lines/cunard-line").to route_to("lines#show", :id => "cunard-line", :locale => "en")
    end

    it "routes to #edit" do
      expect(:get => "/lines/cunard-line/edit").to route_to("lines#edit", :id => "cunard-line", :locale => "en")
    end

    it "routes to #create" do
      expect(:post => "/lines").to route_to("lines#create", :locale => "en")
    end

    it "routes to #update" do
      expect(:put => "/lines/cunard-line").to route_to("lines#update", :id => "cunard-line", :locale => "en")
    end

    it "routes to #destroy" do
      expect(:delete => "/lines/cunard-line").to route_to("lines#destroy", :id => "cunard-line", :locale => "en")
    end

  end

  describe "routing de" do

    it "routes to #index" do
      expect(:get => "/reedereien").to route_to("lines#index", :locale => "de")
    end

    it "routes to #new" do
      expect(:get => "/reedereien/neu").to route_to("lines#new", :locale => "de")
    end

    it "routes to #show" do
      expect(:get => "/reedereien/cunard-line").to route_to("lines#show", :id => "cunard-line", :locale => "de")
    end

    it "routes to #edit" do
      expect(:get => "/reedereien/cunard-line/bearbeiten").to route_to("lines#edit", :id => "cunard-line", :locale => "de")
    end

    it "routes to #create" do
      expect(:post => "/reedereien").to route_to("lines#create", :locale => "de")
    end

    it "routes to #update" do
      expect(:put => "/reedereien/cunard-line").to route_to("lines#update", :id => "cunard-line", :locale => "de")
    end

    it "routes to #destroy" do
      expect(:delete => "/reedereien/cunard-line").to route_to("lines#destroy", :id => "cunard-line", :locale => "de")
    end

  end
end
