require 'rails_helper'

Rspec.describe 'Users', type: :request do
    describe 'Get and checks User ' do
        before(:example) do
            get '\users'
        end

        it 'Checks if the status response is success(OK)' do
            expect(response.status).to be(200)
        end

end