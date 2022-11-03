require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:example) do
    @user = User.create(name: 'John Doe', id: 1)
    @post = Post.create(user: @user, title: 'Post title', text: 'Random text in test', id: 1)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'returns http success' do
      get '/users'
      expect(response.body).to include('<h1>Users</h1>')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end
  end
end
