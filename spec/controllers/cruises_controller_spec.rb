require 'rails_helper'

RSpec.describe CruisesController, :type => :controller do

  let(:ship) { create :ship }
  let(:pos_early) { create :port_of_call, ship: ship}
  let(:pos_late) { create :port_of_call, ship: ship, arrive: "2014-11-23 08:41:11", leave: "2014-11-23 08:41:12" }

  # This should return the minimal set of attributes required to create a valid
  # Cruise. As you add validations to Cruise, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { :title => 'Trip Name', :ship => ship, :embark => pos_early, :disembark => pos_late }
  }
  let(:valid_post_attributes) {
    { :title => 'Trip Name', :ship_id => ship.id, :embark_id => pos_early.to_param, :disembark_id => pos_late.to_param }
  }

  let(:invalid_attributes) {
    { :ship_id => ship.title }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CruisesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cruises as @cruises" do
      cruise = Cruise.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:cruises)).to eq([cruise])
    end
  end

  describe "GET show" do
    it "assigns the requested cruise as @cruise" do
      cruise = Cruise.create! valid_attributes
      get :show, {:id => cruise.to_param}, valid_session
      expect(assigns(:cruise)).to eq(cruise)
    end
  end

  describe "GET new" do
    it "assigns a new cruise as @cruise" do
      get :new, {}, valid_session
      expect(assigns(:cruise)).to be_a_new(Cruise)
    end
  end

  describe "GET edit" do
    it "assigns the requested cruise as @cruise" do
      cruise = Cruise.create! valid_attributes
      get :edit, {:id => cruise.to_param}, valid_session
      expect(assigns(:cruise)).to eq(cruise)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cruise" do
        expect {
          post :create, {:cruise => valid_post_attributes}, valid_session
        }.to change(Cruise, :count).by(1)
      end

      it "assigns a newly created cruise as @cruise" do
        post :create, {:cruise => valid_post_attributes}, valid_session
        expect(assigns(:cruise)).to be_a(Cruise)
        expect(assigns(:cruise)).to be_persisted
      end

      it "redirects to the created cruise" do
        post :create, {:cruise => valid_post_attributes}, valid_session
        expect(response).to redirect_to(Cruise.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cruise as @cruise" do
        post :create, {:cruise => invalid_attributes}, valid_session
        expect(assigns(:cruise)).to be_a_new(Cruise)
      end

      it "re-renders the 'new' template" do
        post :create, {:cruise => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { :title => 'MYTITLE2' }
      }

      it "updates the requested cruise" do
        cruise = Cruise.create! valid_attributes
        put :update, {:id => cruise.to_param, :cruise => new_attributes}, valid_session
        cruise.reload
        expect(cruise.title).to eq('MYTITLE2')
      end

      it "assigns the requested cruise as @cruise" do
        cruise = Cruise.create! valid_attributes
        put :update, {:id => cruise.to_param, :cruise => valid_attributes}, valid_session
        expect(assigns(:cruise)).to eq(cruise)
      end

      it "redirects to the cruise" do
        cruise = Cruise.create! valid_attributes
        put :update, {:id => cruise.to_param, :cruise => valid_attributes}, valid_session
        expect(response).to redirect_to(cruise)
      end
    end

    describe "with invalid params" do
      it "assigns the cruise as @cruise" do
        cruise = Cruise.create! valid_attributes
        put :update, {:id => cruise.to_param, :cruise => invalid_attributes}, valid_session
        expect(assigns(:cruise)).to eq(cruise)
      end

      it "re-renders the 'edit' template" do
        cruise = Cruise.create! valid_attributes
        put :update, {:id => cruise.to_param, :cruise => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cruise" do
      cruise = Cruise.create! valid_attributes
      expect {
        delete :destroy, {:id => cruise.to_param}, valid_session
      }.to change(Cruise, :count).by(-1)
    end

    it "redirects to the cruises list" do
      cruise = Cruise.create! valid_attributes
      delete :destroy, {:id => cruise.to_param}, valid_session
      expect(response).to redirect_to(cruises_url)
    end
  end

end
