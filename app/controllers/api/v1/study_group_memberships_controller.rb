class Api::V1::StudyGroupMembershipsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_study_group

  def index
    members = @study_group.users.select(:id, :username, :first_name, :last_name)
    render json: members
  end

  def create
    membership = @study_group.study_group_memberships.find_or_create_by(user: current_api_v1_user)
    render json: membership, status: :created
  end

  def destroy
    membership = @study_group.study_group_memberships.find_by(user: current_api_v1_user)
    if membership
      membership.destroy
      head :no_content
    else
      render json: { error: "Not a member" }, status: :not_found
    end
  end

  private

  def set_study_group
    @study_group = StudyGroup.find(params[:study_group_id])
  end
end
