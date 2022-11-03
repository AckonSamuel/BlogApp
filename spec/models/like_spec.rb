require_relative './../rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Chrispaix', photo: 'https://i.postimg.cc/yx8BkpTj/4.png ', bio: 'Tech Enthousiast from Burundi.',
                        posts_counter: 0)
    @post = Post.create(user: @user, title: 'Post title', text: 'Sample text post for test purpose', likes_counter: 0,
                        comments_counter: 0)
  end

  context 'Associations' do
    it 'belongs to an author' do
      like = Like.reflect_on_association('user')
      expect(like.macro).to eq(:belongs_to)
    end

    it 'belongs to a post' do
      like = Like.reflect_on_association('post')
      expect(like.macro).to eq(:belongs_to)
    end
  end

  context 'Custom methods' do
    it 'updates likes counter of the post' do
      Like.create(user: @user, post: @post)
      expect(@post.likes_counter).to eq 1
    end
  end
end
