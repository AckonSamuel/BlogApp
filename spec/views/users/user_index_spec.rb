require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'GET /' do
    before do
      @user = User.create(name: 'Chrispaix', photo: 'https://i.postimg.cc/yx8BkpTj/4.png', posts_counter: 0)
      visit '/'
    end
    it 'have here is a list of users text index.html.erb' do
      expect(page).to have_text('Users')
    end

    it 'Check if the user name is displaying' do
      expect(page).to have_text('Chrispaix')
    end

    it 'Check if click on user redirects to user page' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    it 'Check if it has the user profile picture' do
      visit users_path
      images = page.all('img')
      expect(images[0]['src']).to have_content('https://i.postimg.cc/yx8BkpTj/4.png')
    end

    it 'Check if we are redirected to the user page when clicking on a user' do
      visit users_path
      link = page.first('a')
      link.click
      expect(page).to have_current_path('/users/1')
    end
  end
end
