class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ destroy ]
  before_action :confirm_chat_authorization

  # GET /chats or /chats.json
  def index
    @chats = Chat.where(teacher_id: current_teacher.id)
  end

  # GET /chats/1 or /chats/1.json
  def show
    if current_teacher.id == 1
      @chats = Chat.where(teacher_id: params[:id])
    else
      @chats = Chat.where(teacher_id: current_teacher.id)
    end
  end

  # GET /chats/new
  def new
    @chat = Chat.new
    if current_teacher.id == 1
      if params[:teacher_id]
        @chat.teacher_id = params[:teacher_id].to_i
        @chat.is_from = false
      else
        redirect_to root_path
      end
    else
      @chat.teacher_id = current_teacher.id
      @chat.is_from = true
    end
  end

  # POST /chats or /chats.json
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        UserMailer.sent_chat(@chat).deliver_now
        format.html { redirect_to chat_url(@chat.teacher_id), notice: "Chat was successfully created." }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:message, :is_from, :teacher_id)
    end

    def confirm_chat_authorization
      unless teacher_signed_in?
        redirect_to root_path
      end
    end
end
