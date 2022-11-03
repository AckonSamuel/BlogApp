require 'rails_helper'

RSpec.describe 'Users and user page contents', type: :feature do
  describe 'GET /' do
    # describe 'Check the user show page' do
    #   before do
    #     @user = User.create(name: 'Itachi', photo: 'https://i.postimg.cc/yx8BkpTj/4.png', bio: 'lojay', posts_counter: 0)
    #     @post = Post.create(user: @user, title: 'heloa', comments_counter: 0, likes_counter: 0)
    #     visit '/'
    #   end

    it 'Check if the users profile picture is present' do
      visit '/users/1'
      img = page.find('img')
      expect(img['src']).to have_content('https://i.postimg.cc/yx8BkpTj/4.png')
    end

    it 'Check the username' do
      visit '/users/2'
      username = page.find('.author')
      expect(username).to have_content('Post from Chrispaix')
    end

    it 'Check the users posts counter' do
      visit '/users/3'
      posts_counter = page.find('.thaw')
      expect(posts_counter).to have_content('Number of Posts : 0')
    end

    it 'Check the users bio' do
      visit '/users/3'
      bio = page.find('.there')
      expect(bio).to have_content('Bio')
    end
  end
end
