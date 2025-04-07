class Course < ApplicationRecord
    has_many :reviews, as: :reviewable, dependent: :destroy

    def avg_rating
        reviews.average(:rating)&.round(2) || 0
    end
end
