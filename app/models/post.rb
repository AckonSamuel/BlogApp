class Post < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :likes
    has_many :comments
end
