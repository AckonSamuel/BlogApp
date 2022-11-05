class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :comments_counter, :likes_counter, :created_at, :updated_at, :user_id
end
