class Api::V1::InstructorsController < ApplicationController
  def index
    render json: Instructor.all, each_serializer: InstructorSerializer
  end

  def show
    @instructor = Instructor.find(params[:id])
    if @instructor
      render json: @instructor, status: :ok
    else
      render status: :unprocessable_entity
    end
  end
end
