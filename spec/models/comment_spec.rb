require_relative './../rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'Abdel Oumer Ali', photo: 'https://i.postimg.cc/yx8BkpTj/4.png ', bio: 'Tech Enthousiast.',
                        posts_counter: 0)
    @post = Post.create(user: @user, title: 'Post title', text: 'This is my first post', likes_counter: 0,
                        comments_counter: 0)
  end

  context 'Associations' do
    it 'belongs to an author' do
      comment = Comment.reflect_on_association('user')
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'belongs to a post' do
      comment = Comment.reflect_on_association('post')
      expect(comment.macro).to eq(:belongs_to)
    end
  end

  context 'Custom methods' do
    it 'updates likes counter of the post' do
      Comment.create(user: @user, post: @post, text: 'I like this post')
      expect(@post.comments_counter).to eq 1
    end
  end
end
