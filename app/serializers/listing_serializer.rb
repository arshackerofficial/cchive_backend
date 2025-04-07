class ListingSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :price, :seller, :seller_id

  def seller
    object.user.first_name + " " + object.user.last_name
  end

  def seller_id
    object.user.username
  end
end
