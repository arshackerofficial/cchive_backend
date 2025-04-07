class Api::V1::TutorProfilesController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    render json: TutorProfile.all
  end

  def create
    @tutor_profile = current_api_v1_user.build_tutor_profile(tutor_profile_params)
    if @tutor_profile.save
      render json: @tutor_profile, status: :created
    else
      render json: @tutor_profile.errors, status: :unprocessable_entity
    end
  end

  def my_tutor_profile
    profile = current_api_v1_user.tutor_profile
    if profile
      render json: profile, serializer: TutorProfileSerializer
    else
      render json: {}, status: :not_found
    end
  end


  private
  def tutor_profile_params
    params.require(:tutor_profile).permit(subjects: [])
  end
end
