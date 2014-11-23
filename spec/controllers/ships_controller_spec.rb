require 'rails_helper'

RSpec.describe ShipsController, :type => :controller do

  let(:line) { create :line }
  let(:port) { create :port }

  let(:valid_attributes) {
    { :title => 'MyShip', :line_id => line.id, :port_of_origin_id => port.id }
  }

  let(:invalid_attributes) {
    { :title => 'MyShip', :line_id => nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShipsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all ships as @ships" do
      ship = Ship.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:ships)).to eq([ship])
    end
  end

  describe "GET show" do
    it "assigns the requested ship as @ship" do
      ship = Ship.create! valid_attributes
      get :show, {:id => ship.to_param}, valid_session
      expect(assigns(:ship)).to eq(ship)
    end
  end

  describe "GET new" do
    it "assigns a new ship as @ship" do
      get :new, {}, valid_session
      expect(assigns(:ship)).to be_a_new(Ship)
    end
  end

  describe "GET edit" do
    it "assigns the requested ship as @ship" do
      ship = Ship.create! valid_attributes
      get :edit, {:id => ship.to_param}, valid_session
      expect(assigns(:ship)).to eq(ship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ship" do
        expect {
          post :create, {:ship => valid_attributes}, valid_session
        }.to change(Ship, :count).by(1)
      end

      it "assigns a newly created ship as @ship" do
        post :create, {:ship => valid_attributes}, valid_session
        expect(assigns(:ship)).to be_a(Ship)
        expect(assigns(:ship)).to be_persisted
      end

      it "redirects to the created ship" do
        post :create, {:ship => valid_attributes}, valid_session
        expect(response).to redirect_to(Ship.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ship as @ship" do
        post :create, {:ship => invalid_attributes}, valid_session
        expect(assigns(:ship)).to be_a_new(Ship)
      end

      it "re-renders the 'new' template" do
        post :create, {:ship => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { :title => 'NewShipName2' }
      }

      it "updates the requested ship" do
        ship = Ship.create! valid_attributes
        put :update, {:id => ship.to_param, :ship => new_attributes}, valid_session
        ship.reload
        expect(ship.title).to eq(new_attributes[:title])
      end

      it "assigns the requested ship as @ship" do
        ship = Ship.create! valid_attributes
        put :update, {:id => ship.to_param, :ship => valid_attributes}, valid_session
        expect(assigns(:ship)).to eq(ship)
      end

      it "redirects to the ship" do
        ship = Ship.create! valid_attributes
        put :update, {:id => ship.to_param, :ship => valid_attributes}, valid_session
        expect(response).to redirect_to(ship)
      end
    end

    describe "with invalid params" do
      it "assigns the ship as @ship" do
        ship = Ship.create! valid_attributes
        put :update, {:id => ship.to_param, :ship => invalid_attributes}, valid_session
        expect(assigns(:ship)).to eq(ship)
      end

      it "re-renders the 'edit' template" do
        ship = Ship.create! valid_attributes
        put :update, {:id => ship.to_param, :ship => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ship" do
      ship = Ship.create! valid_attributes
      expect {
        delete :destroy, {:id => ship.to_param}, valid_session
      }.to change(Ship, :count).by(-1)
    end

    it "redirects to the ships list" do
      ship = Ship.create! valid_attributes
      delete :destroy, {:id => ship.to_param}, valid_session
      expect(response).to redirect_to(ships_url)
    end
  end

end
