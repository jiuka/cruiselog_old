class CruiseSegmentsController < ApplicationController
  before_action :set_cruise_segment, only: [:show, :edit, :update, :destroy]

  # GET /cruise_segments
  # GET /cruise_segments.json
  def index
    @cruise_segments = CruiseSegment.where(:cruise_id => params[:cruise_id])
  end

  # GET /cruise_segments/1
  # GET /cruise_segments/1.json
  def show
  end

  # GET /cruise_segments/new
  def new
    @cruise_segment = CruiseSegment.new
  end

  # GET /cruise_segments/1/edit
  def edit
  end

  # POST /cruise_segments
  # POST /cruise_segments.json
  def create
    @cruise_segment = CruiseSegment.new(cruise_segment_params)

    respond_to do |format|
      if @cruise_segment.save
        format.html { redirect_to @cruise_segment.cruise, notice: 'Cruise segment was successfully created.' }
        format.json { render :show, status: :created, location: @cruise_segment }
      else
        format.html { render :new }
        format.json { render json: @cruise_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cruise_segments/1
  # PATCH/PUT /cruise_segments/1.json
  def update
    respond_to do |format|
      if @cruise_segment.update(cruise_segment_params)
        format.html { redirect_to @cruise_segment.cruise, notice: 'Cruise segment was successfully updated.' }
        format.json { render :show, status: :ok, location: @cruise_segment }
      else
        format.html { render :edit }
        format.json { render json: @cruise_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cruise_segments/1
  # DELETE /cruise_segments/1.json
  def destroy
    @cruise_segment.destroy
    respond_to do |format|
      format.html { redirect_to cruise_segments_url, notice: 'Cruise segment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cruise_segment
      @cruise_segment = CruiseSegment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cruise_segment_params
      params.require(:cruise_segment).permit(:cruise_id, :from_id, :to_id, :route)
    end
end
