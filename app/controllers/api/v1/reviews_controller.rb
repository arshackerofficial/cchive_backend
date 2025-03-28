class Api::V1::ReviewsController < ApplicationController
    before_action :authenticate_api_v1_user!

    def create
        @review = @reviewable.reviews.build(review_params)
        @review.user_id = current_api_v1_user.id
        if @review.save
            render json: @review, status: :created
        else
            nil
        end
    end

    private
    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
