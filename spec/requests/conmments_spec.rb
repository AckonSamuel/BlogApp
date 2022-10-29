require 'rails_helper'

RSpec.describe 'Conmments', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/conmments/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/conmments/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /comment_params' do
    it 'returns http success' do
      get '/conmments/comment_params'
      expect(response).to have_http_status(:success)
    end
  end
end
