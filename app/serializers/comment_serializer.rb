class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :updated_at, :user_id, :post_id
end
