class LinesController < ApplicationController
  before_action :set_line, only: [:show]

  # GET /lines
  # GET /lines.json
  def index
    @lines = Line.all
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:title)
    end
end
