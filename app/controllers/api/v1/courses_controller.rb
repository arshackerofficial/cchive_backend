class Api::V1::CoursesController < ApplicationController
  def index
    render json: Course.all, status: :ok
  end

  def show
    @course = Course.find(params[:id])
    if @course
      render json: @course, status: :ok
    else
      render status: :unprocessable_entity
    end
  end
end
