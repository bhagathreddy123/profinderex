require 'rails_helper'

RSpec.describe UsersController do 
  describe 'GET index' do
    let(:user) { create :user }

    it 'assigns @users' do 
      sign_in(user)
      get :index
      expect(assigns(:users)).to eq([user])
    end 

    it 'returns the status code ok' do 
      expect(response).to have_http_status(:ok)	
    end
  end
end
