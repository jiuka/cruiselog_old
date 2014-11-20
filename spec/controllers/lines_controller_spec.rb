require 'rails_helper'

RSpec.describe LinesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Line. As you add validations to Line, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { :title => 'Cunard Line' }
  }

  let(:invalid_attributes) {
    { :title => '' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LinesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all lines as @lines" do
      line = Line.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:lines)).to eq([line])
    end
  end

  describe "GET show" do
    it "assigns the requested line as @line" do
      line = Line.create! valid_attributes
      get :show, {:id => line.to_param}, valid_session
      expect(assigns(:line)).to eq(line)
    end
  end

  describe "GET new" do
    it "assigns a new line as @line" do
      get :new, {}, valid_session
      expect(assigns(:line)).to be_a_new(Line)
    end
  end

  describe "GET edit" do
    it "assigns the requested line as @line" do
      line = Line.create! valid_attributes
      get :edit, {:id => line.to_param}, valid_session
      expect(assigns(:line)).to eq(line)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Line" do
        expect {
          post :create, {:line => valid_attributes}, valid_session
        }.to change(Line, :count).by(1)
      end

      it "assigns a newly created line as @line" do
        post :create, {:line => valid_attributes}, valid_session
        expect(assigns(:line)).to be_a(Line)
        expect(assigns(:line)).to be_persisted
      end

      it "redirects to the created line" do
        post :create, {:line => valid_attributes}, valid_session
        expect(response).to redirect_to(Line.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved line as @line" do
        post :create, {:line => invalid_attributes}, valid_session
        expect(assigns(:line)).to be_a_new(Line)
      end

      it "re-renders the 'new' template" do
        post :create, {:line => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { :title => 'Costa' }
      }

      it "updates the requested line" do
        line = Line.create! valid_attributes
        put :update, {:id => line.to_param, :line => new_attributes}, valid_session
        line.reload
        expect(line.title).to eq('Costa')
      end

      it "assigns the requested line as @line" do
        line = Line.create! valid_attributes
        put :update, {:id => line.to_param, :line => valid_attributes}, valid_session
        expect(assigns(:line)).to eq(line)
      end

      it "redirects to the line" do
        line = Line.create! valid_attributes
        put :update, {:id => line.to_param, :line => valid_attributes}, valid_session
        expect(response).to redirect_to(line)
      end
    end

    describe "with invalid params" do
      it "assigns the line as @line" do
        line = Line.create! valid_attributes
        put :update, {:id => line.to_param, :line => invalid_attributes}, valid_session
        expect(assigns(:line)).to eq(line)
      end

      it "re-renders the 'edit' template" do
        line = Line.create! valid_attributes
        put :update, {:id => line.to_param, :line => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested line" do
      line = Line.create! valid_attributes
      expect {
        delete :destroy, {:id => line.to_param}, valid_session
      }.to change(Line, :count).by(-1)
    end

    it "redirects to the lines list" do
      line = Line.create! valid_attributes
      delete :destroy, {:id => line.to_param}, valid_session
      expect(response).to redirect_to(lines_url)
    end
  end

end
