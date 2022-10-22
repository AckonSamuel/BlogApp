require_relative './../rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(
    name: 'Stephen Seber', photo: 'https://www.pexels.com/photo/grayscale-photo-of-laughing-woman-holding-her-hat-1054251/',
    bio: 'Hey there, I am Stephen Seber.', posts_counter: 0
  )

  post = Post.create(
    title: 'Photographer', text: 'Hey there, I am Stephen Seber, a professional photographer', comments_counter: 0,
    likes_counter: 0, user_id: user.id
  )

  comment = Comment.create(post:, user:)

  comment.update_comments_counter

  it ' Check if it increment comments_counter' do
    expect(Post.find(post.id).comments_counter).eql?(post.comments_counter + 1)
  end
end
