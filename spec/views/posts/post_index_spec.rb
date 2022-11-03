require 'rails_helper'

RSpec.describe 'Users and user page contents', type: :feature do
  describe 'Check the post index page' do
    it 'shows the users profile picture' do
      visit '/users/1/posts'
      img = page.find('img')
      expect(img['src']).to have_content('https://i.postimg.cc/yx8BkpTj/4.png')
    end

    it 'Check the users username' do
      visit '/users/1/posts'
      username = page.find('.user-infos')
      expect(username).to have_content('Abdel')
    end

    it 'Check the users posts counter' do
      visit '/users/1/posts'
      posts_counter = page.find('.user-infos')
      expect(posts_counter).to have_content('Number of Posts : 1')
    end

    it 'Check the title of a post' do
      visit '/users/1/posts'
      post = page.first('.post')
      expect(post).to have_content('This is my first post')
    end

    it 'Check how many comments a post has' do
      visit '/users/1/posts'
      post = page.first('.post')
      expect(post).to have_content('Comments 0')
    end
  end
end
