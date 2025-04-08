# app/serializers/message_serializer.rb
class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :full_name, :created_at

  def full_name
    object.user.first_name + " " + object.user.last_name
  end
end
