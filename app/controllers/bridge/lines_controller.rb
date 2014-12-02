class Bridge::LinesController < BridgeController
  before_action :set_line, only: [:show, :edit, :update, :destroy]
  before_action :set_lines

  # GET /bridge/lines
  # GET /bridge/lines.json
  def index
  end

  # GET /bridge/lines/1
  # GET /bridge/lines/1.json
  def show
  end

  # GET /bridge/lines/new
  def new
    @line = Line.new
  end

  # GET /bridge/lines/1/edit
  def edit
  end

  # POST /bridge/lines
  # POST /bridge/lines.json
  def create
    @line = Line.new(line_params)

    respond_to do |format|
      if @line.save
        format.html { redirect_to @line, notice: 'Line was successfully created.' }
        format.json { render :show, status: :created, location: @line }
      else
        format.html { render :new }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bridge/lines/1
  # PATCH/PUT /bridge/lines/1.json
  def update
    respond_to do |format|
      if @line.update(line_params)
        format.html { redirect_to bridge_line_path(@line), notice: 'Line was successfully updated.' }
        format.json { render :show, status: :ok, location: @line }
      else
        format.html { render :edit }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bridge/lines/1
  # DELETE /bridge/lines/1.json
  def destroy
    @line.destroy
    respond_to do |format|
      format.html { redirect_to lines_url, notice: 'Line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.friendly.find(params[:id])
    end

    def set_lines
      @lines = Line.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:title)
    end
end
