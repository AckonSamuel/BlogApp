class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
