class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    render json: @conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    render json: @conversation, include: ['messages.user']
  end

  def create
    if Conversation.between(current_user.id, params[:receiver_id]).present?
      @conversation = Conversation.between(current_user.id, params[:receiver_id]).first
    else
      @conversation = Conversation.new(conversation_params)
      @conversation.sender = current_user

      return render json: @conversation.errors, status: :unprocessable_entity unless @conversation.save
    end

    render json: @conversation, status: :ok
  end

  def destroy
    @conversation =  Conversation.find(params[:id])
    @conversation.destroy
  end

  private
    def conversation_params
      params.permit(:receiver_id)
    end

end
