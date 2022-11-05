class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :photo, :posts_counter
end
