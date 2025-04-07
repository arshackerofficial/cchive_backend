class ListingSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :price, :seller

  def seller
    object.user.first_name + " " + object.user.last_name
  end
end
