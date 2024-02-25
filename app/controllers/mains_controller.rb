class MainsController < ApplicationController
  before_action :set_main, only: %i[ show edit update destroy ]

  # GET /mains or /mains.json
  def index
    @mains = Main.all
  end

  # GET /mains/1 or /mains/1.json
  def show
  end

  # GET /mains/new
  def new
    if session[:student_id].blank?
      redirect_to students_path
    end
    @main = Main.new
    @main.student_id = session[:student_id].to_i
    @main.flows.new
  end

  # GET /mains/1/edit
  def edit
    @main.flows.new
  end

  # POST /mains or /mains.json
  def create
    @main = Main.new(main_params)
    respond_to do |format|
      if @main.save
        @main.flows.each do |flow|
          flow.order = flow.id
          flow.save
        end
        format.html { redirect_to main_url(@main), notice: "Main was successfully created." }
        format.json { render :show, status: :created, location: @main }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mains/1 or /mains/1.json
  def update
    student_id = @main.student_id
    respond_to do |format|
      if @main.update(main_params)
        @main.flows.each do |flow|
          if flow.order.nil?
            flow.order = flow.id
            flow.save
          end
        end
        @main.student_id = student_id
        @main.updated_at = Time.now
        @main.save
        format.html { redirect_to main_url(@main), notice: "Main was successfully updated." }
        format.json { render :show, status: :ok, location: @main }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mains/1 or /mains/1.json
  def destroy
    student_id = @main.student_id
    @main.destroy

    respond_to do |format|
      format.html { redirect_to "#{students_path}/#{student_id}", notice: "授業データを削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main
      @main = Main.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_params
      params.require(:main).permit(:subject, :student_id, :is_giving_answer, :supplement, flows_attributes: [:id, :content], main_textbooks_attributes: [:id, :finished_place, :textbook_id], homeworks_attributes: [:id, :amount, :textbook_id])
    end
end
