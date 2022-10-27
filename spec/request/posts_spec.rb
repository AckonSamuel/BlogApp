require 'rails_helper'

Rspec.describe 'Users', type: :request do
    describe 'Get and checks User ' do
        before(:example) do
            get '\users'
        end

        it 'Checks if the status response is success(OK)' do
            expect(response.status).to be(200)
        end

        it 'Checks if it render the correct template' do
            expect(response).to render_template(:index)
        end

        it 'Checks the placeholder text' do
            expect(response.body).to include('<h1>Users</h1>')
        end
end