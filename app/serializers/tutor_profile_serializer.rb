class TutorProfileSerializer < ActiveModel::Serializer
  attributes :id, :subjects, :tutor_name

  def tutor_name
    [ object.user.first_name, object.user.last_name ].compact.join(" ")
  end
end
