class Api::V1::Instructors::ReviewsController < Api::V1::ReviewsController
    before_action :set_reviewable

    private
    def set_reviewable
        @reviewable = Instructor.find(params[:instructor_id])
        Rails.logger.debug "Reviewable set to: #{@reviewable.inspect}"
    end
end
