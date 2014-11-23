require 'rails_helper'

RSpec.describe PortOfCallsController, :type => :controller do
  include PortOfCallsHelper

  let(:ship) { create :ship }
  let(:port) { create :port }

  # This should return the minimal set of attributes required to create a valid
  # PortOfCall. As you add validations to PortOfCall, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { :ship => ship, :port => port, :arrive => Time.now.to_s, :leave => (Time.now+1).to_s }
  }

  let(:valid_post_attributes) {
    { :ship_id => ship.id, :port_id => port.id, :arrive => Time.now.to_s, :leave => (Time.now+1).to_s }
  }

  let(:invalid_attributes) {
    { :arrive => Time.now.to_s, :leave => (Time.now-1).to_s }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PortOfCallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all port_of_calls as @port_of_calls" do
      port_of_call = PortOfCall.create! valid_attributes
      get :index, {:ship_id => port_of_call.ship.to_param}, valid_session
      expect(assigns(:port_of_calls)).to eq([port_of_call])
    end
  end

  describe "GET show" do
    it "assigns the requested port_of_call as @port_of_call" do
      port_of_call = PortOfCall.create! valid_attributes
      get :show, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param}, valid_session
      expect(assigns(:port_of_call)).to eq(port_of_call)
    end
  end

  describe "GET new" do
    it "assigns a new port_of_call as @port_of_call" do
      get :new, {:ship_id => ship.to_param}, valid_session
      expect(assigns(:port_of_call)).to be_a_new(PortOfCall)
    end
  end

  describe "GET edit" do
    it "assigns the requested port_of_call as @port_of_call" do
      port_of_call = PortOfCall.create! valid_attributes
      get :edit, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param}, valid_session
      expect(assigns(:port_of_call)).to eq(port_of_call)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PortOfCall" do
        expect {
          post :create, {:ship_id => ship.to_param, :port_of_call => valid_post_attributes}, valid_session
        }.to change(PortOfCall, :count).by(1)
      end

      it "assigns a newly created port_of_call as @port_of_call" do
        post :create, {:ship_id => ship.to_param, :port_of_call => valid_post_attributes}, valid_session
        expect(assigns(:port_of_call)).to be_a(PortOfCall)
        expect(assigns(:port_of_call)).to be_persisted
      end

      it "redirects to the created port_of_call" do
        post :create, {:ship_id => ship.to_param, :port_of_call => valid_post_attributes}, valid_session
        expect(response).to redirect_to(PortOfCall.last.ship)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved port_of_call as @port_of_call" do
        post :create, {:ship_id => ship.to_param, :port_of_call => invalid_attributes}, valid_session
        expect(assigns(:port_of_call)).to be_a_new(PortOfCall)
      end

      it "re-renders the 'new' template" do
        post :create, {:ship_id => ship.to_param, :port_of_call => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { arrive: "2014-11-23 16:03:42 +0000" }
      }

      it "updates the requested port_of_call" do
        port_of_call = PortOfCall.create! valid_attributes
        put :update, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param, :port_of_call => new_attributes}, valid_session
        port_of_call.reload
        expect(port_of_call.arrive).to eq("2014-11-23 16:03:42 +0000")
      end

      it "assigns the requested port_of_call as @port_of_call" do
        port_of_call = PortOfCall.create! valid_attributes
        put :update, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param, :port_of_call => valid_attributes}, valid_session
        expect(assigns(:port_of_call)).to eq(port_of_call)
      end

      it "redirects to the port_of_call" do
        port_of_call = PortOfCall.create! valid_attributes
        put :update, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param, :port_of_call => valid_attributes}, valid_session
        expect(response).to redirect_to(port_of_call)
      end
    end

    describe "with invalid params" do
      it "assigns the port_of_call as @port_of_call" do
        port_of_call = PortOfCall.create! valid_attributes
        put :update, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param, :port_of_call => invalid_attributes}, valid_session
        expect(assigns(:port_of_call)).to eq(port_of_call)
      end

      it "re-renders the 'edit' template" do
        port_of_call = PortOfCall.create! valid_attributes
        put :update, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param, :port_of_call => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested port_of_call" do
      port_of_call = PortOfCall.create! valid_attributes
      expect {
        delete :destroy, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param}, valid_session
      }.to change(PortOfCall, :count).by(-1)
    end

    it "redirects to the port_of_calls list" do
      port_of_call = PortOfCall.create! valid_attributes
      delete :destroy, {:id => port_of_call.to_param, :ship_id => port_of_call.ship.to_param}, valid_session
      expect(response).to redirect_to(port_of_calls_url)
    end
  end

end
