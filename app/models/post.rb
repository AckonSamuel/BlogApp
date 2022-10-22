class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 200 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
