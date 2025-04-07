class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :author

  def author
    object.user.first_name + " " + object.user.last_name
  end
end
