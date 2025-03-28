class Api::V1::MessagesController < ApplicationController
  before_action :set_study_group
  def index
    @messages = @study_group.messages.order(created_at: :asc) 
    render json: @messages, status: :ok
  end
  def create
    @message = @study_group.messages.new(message_params)

    if @message.save
      StudyGroupChannel.broadcast_to(
        @study_group,
        message: @message.content,
        user_id: @message.user_id
      )
      render json: @message, status: :created
    else
      render json: { error: "Message could not be sent" }, status: :unprocessable_entity
    end
  end

  private

  def set_study_group
    @study_group = StudyGroup.find(params[:study_group_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :study_group_id)
  end
end
