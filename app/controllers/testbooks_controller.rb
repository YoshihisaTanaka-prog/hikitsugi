class TestbooksController < ApplicationController
  before_action :set_testbook, only: %i[ show edit update destroy ]

  # GET /testbooks or /testbooks.json
  def index
    @testbooks = Testbook.all
  end

  # GET /testbooks/1 or /testbooks/1.json
  def show
  end

  # GET /testbooks/new
  def new
    @testbook = Testbook.new
  end

  # GET /testbooks/1/edit
  def edit
  end

  # POST /testbooks or /testbooks.json
  def create
    @testbook = Testbook.new(testbook_params)

    respond_to do |format|
      if @testbook.save
        format.html { redirect_to testbook_url(@testbook), notice: "Testbook was successfully created." }
        format.json { render :show, status: :created, location: @testbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @testbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testbooks/1 or /testbooks/1.json
  def update
    respond_to do |format|
      if @testbook.update(testbook_params)
        format.html { redirect_to testbook_url(@testbook), notice: "Testbook was successfully updated." }
        format.json { render :show, status: :ok, location: @testbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @testbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testbooks/1 or /testbooks/1.json
  def destroy
    @testbook.destroy

    respond_to do |format|
      format.html { redirect_to testbooks_url, notice: "Testbook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testbook
      @testbook = Testbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def testbook_params
      params.require(:testbook).permit(:name, :name_kana)
    end
end
