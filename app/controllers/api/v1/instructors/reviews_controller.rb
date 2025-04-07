class Api::V1::Instructors::ReviewsController < Api::V1::ReviewsController
    before_action :set_reviewable

    def index
        render json: @reviewable.reviews, status: :ok
    end

    private
    def set_reviewable
        @reviewable = Instructor.find(params[:instructor_id])
    end
end
