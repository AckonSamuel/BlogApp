require_relative './../rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(
    name: 'Stephen Seber', photo: 'https://www.pexels.com/photo/grayscale-photo-of-laughing-woman-holding-her-hat-1054251/',
    bio: 'Hey there, I am Stephen Seber.', posts_counter: 0
  )

  post = Post.create(
    title: 'Stephen post', text: 'Hey there, I am Stephen Seber.', comments_counter: 0,
    likes_counter: 0, user_id: user.id
  )

  like = Like.create(post:, user:)

  like.update_likes_counter

  it 'Check if it increment likes_counter' do
    expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
  end
end
