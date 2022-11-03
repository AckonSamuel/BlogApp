require 'rails_helper'

RSpec.describe 'Users and user page contents', type: :feature do
  describe 'Check the post show page' do
    it 'Check the posts Page title' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Specific post')
    end

    it 'Check the posts author' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Abdel')
    end

    it 'Check the number of comments' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Comments: 0')
    end

    it 'Check the number of likes' do
      visit '/users/1/posts/1'
      expect(page).to have_content('Likes: 0')
    end
  end
end
