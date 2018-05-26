class CardboardsController < ApplicationController
  before_action :set_cardboard, only: [:show, :edit, :update, :destroy]

  # GET /cardboards
  # GET /cardboards.json
  def index
    @cardboards = Cardboard.all.map{|cardboard| cardboard.attributes.merge(url: cardboard_path(cardboard.id))}
  end

  # GET /cardboards/1
  # GET /cardboards/1.json
  def show
  end

  # GET /cardboards/new
  def new
    @cardboard = Cardboard.new
  end

  # GET /cardboards/1/edit
  def edit
  end

  # POST /cardboards
  # POST /cardboards.json
  def create
    @cardboard = Cardboard.new(cardboard_params)

    respond_to do |format|
      if @cardboard.save
        format.html { redirect_to @cardboard, notice: 'Cardboard was successfully created.' }
        format.json { render :show, status: :created, location: @cardboard }
      else
        format.html { render :new }
        format.json { render json: @cardboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cardboards/1
  # PATCH/PUT /cardboards/1.json
  def update
    respond_to do |format|
      if @cardboard.update(cardboard_params)
        format.html { redirect_to @cardboard, notice: 'Cardboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @cardboard }
      else
        format.html { render :edit }
        format.json { render json: @cardboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cardboards/1
  # DELETE /cardboards/1.json
  def destroy
    @cardboard.destroy
    respond_to do |format|
      format.html { redirect_to cardboards_url, notice: 'Cardboard was successfully destroyed.' }
      format.json { head :no_content }
    end
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
