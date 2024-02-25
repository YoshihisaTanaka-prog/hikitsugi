class AriaController < ApplicationController
  before_action :set_arium, only: %i[ show edit update destroy ]

  # GET /aria or /aria.json
  def index
    @aria = Arium.all
  end

  # GET /aria/1 or /aria/1.json
  def show
  end

  # GET /aria/new
  def new
    @arium = Arium.new
  end

  # GET /aria/1/edit
  def edit
  end

  # POST /aria or /aria.json
  def create
    @arium = Arium.new(arium_params)

    respond_to do |format|
      if @arium.save
        format.html { redirect_to arium_url(@arium), notice: "Arium was successfully created." }
        format.json { render :show, status: :created, location: @arium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @arium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aria/1 or /aria/1.json
  def update
    respond_to do |format|
      if @arium.update(arium_params)
        format.html { redirect_to arium_url(@arium), notice: "Arium was successfully updated." }
        format.json { render :show, status: :ok, location: @arium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @arium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aria/1 or /aria/1.json
  def destroy
    @arium.destroy

    respond_to do |format|
      format.html { redirect_to aria_url, notice: "Arium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arium
      @arium = Arium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def arium_params
      params.require(:arium).permit(:name)
    end
end
