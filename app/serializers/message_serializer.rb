# app/serializers/message_serializer.rb
class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :username, :created_at

  def username
    object.user.username
  end
end
