class CardboardsController < ApplicationController
  before_action :set_cardboard, only: [:show]

  # GET /cardboards
  # GET /cardboards.json
  def index
    @cardboards = Cardboard.all.map{|cardboard| cardboard.attributes.merge(
      {
        url: cardboard_path(cardboard.id)
      }
    )}
  end

  # GET /cardboards/1
  # GET /cardboards/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cardboard
      @cardboard = Cardboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cardboard_params
      params.require(:cardboard).permit(:cardboard_type, :price)
    end
end
