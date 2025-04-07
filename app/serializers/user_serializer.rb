class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :bio
end
