class Api::V1::Courses::ReviewsController < Api::V1::ReviewsController
    before_action :set_reviewable

    private
    def set_reviewable
        @reviewable = Course.find(params[:course_id])
        Rails.logger.debug "Reviewable set to: #{@reviewable.inspect}"
    end
end
