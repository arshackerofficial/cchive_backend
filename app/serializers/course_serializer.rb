class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :avg_rating, :subject, :course_number, :credits
end
