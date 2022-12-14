require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'Checks proper rendering' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    # it 'Checks proper place holder' do
    #   get '/users/1/posts'
    #   expect(response.body).to include('<h1>Posts page</h1>')
    # end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/1/'
      expect(response).to have_http_status(:success)
    end

    it 'Checks proper rendering' do
      get '/users/1/posts/1/'
      expect(response).to render_template(:show)
    end

    # it 'Checks proper place holder' do
    #   get '/users/1/posts/1/'
    #   expect(response.body).to include('<h2>Lists of posts</h2>')
    # end
  end
end
