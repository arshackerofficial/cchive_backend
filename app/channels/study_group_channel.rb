class StudyGroupChannel < ApplicationCable::Channel
  def subscribed
    study_group = StudyGroup.find(params[:study_group_id])
    stream_for study_group
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
