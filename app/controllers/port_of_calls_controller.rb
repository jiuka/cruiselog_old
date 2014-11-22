class PortOfCallsController < ApplicationController
  before_action :set_port_of_call, only: [:show, :edit, :update, :destroy]

  # GET /port_of_calls
  # GET /port_of_calls.json
  def index
    @port_of_calls = PortOfCall.all
  end

  # GET /port_of_calls/1
  # GET /port_of_calls/1.json
  def show
  end

  # GET /port_of_calls/new
  def new
    @port_of_call = PortOfCall.new
    @port_of_call.ship = Ship.friendly.find(params[:ship_id])
  end

  # GET /port_of_calls/1/edit
  def edit
  end

  # POST /port_of_calls
  # POST /port_of_calls.json
  def create
    @port_of_call = PortOfCall.new(port_of_call_params)

    respond_to do |format|
      if @port_of_call.save
        format.html { redirect_to @port_of_call.ship, notice: 'Port of call was successfully created.' }
        format.json { render :show, status: :created, location: @port_of_call }
      else
        format.html { render :new }
        format.json { render json: @port_of_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /port_of_calls/1
  # PATCH/PUT /port_of_calls/1.json
  def update
    respond_to do |format|
      if @port_of_call.update(port_of_call_params)
        format.html { redirect_to @port_of_call, notice: 'Port of call was successfully updated.' }
        format.json { render :show, status: :ok, location: @port_of_call }
      else
        format.html { render :edit }
        format.json { render json: @port_of_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /port_of_calls/1
  # DELETE /port_of_calls/1.json
  def destroy
    @port_of_call.destroy
    respond_to do |format|
      format.html { redirect_to port_of_calls_url, notice: 'Port of call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_port_of_call
      @port_of_call = PortOfCall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def port_of_call_params
      params.require(:port_of_call).permit(:ship_id, :port_id, :arrive, :leave)
    end
end
