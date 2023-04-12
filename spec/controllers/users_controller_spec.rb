require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { user: { name: 'John' } } }
    end
    context 'with invalid parameters' do
      let(:invalid_params) { { user: { name: '' } } }

      it 'does not create a new user' do
        expect do
          post :create, params: invalid_params
        end.not_to change(User, :count)
      end
    end
  end
end
