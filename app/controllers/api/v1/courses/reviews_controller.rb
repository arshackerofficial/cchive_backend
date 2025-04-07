class Api::V1::Courses::ReviewsController < Api::V1::ReviewsController
    before_action :set_reviewable

    def index
        render json: @reviewable.reviews, status: :ok
    end
    private
    def set_reviewable
        @reviewable = Course.find(params[:course_id])
    end
end
