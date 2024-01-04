require 'rails_helper'

RSpec.describe UsersController do 
  describe 'GET index' do
    let(:user) { create :user }

    before(:each) do 
      sign_in(user)
      get :index
    end

    it 'assigns @users' do 
      expect(assigns(:users)).to eq([user])
      expect(response).to render_template('index')
    end 

    it 'renders the index template' do 
      expect(response).to render_template('index')
    end

    it 'returns the status code ok' do 
      expect(response).to have_http_status(:ok)	
    end
  end

  describe 'POST create' do 
    let(:user) { create :user }

    before(:each) do 
      sign_in(user)
    end

    it 'should accepts the params with turbo_stream format' do 
      post :create, params: {
        user: user_params,
        format: :turbo_stream
      }
      
      expect(response.media_type).to eq('text/vnd.turbo-stream.html')
      expect(response.content_type).to eq('text/vnd.turbo-stream.html; charset=utf-8')
    end

    it 'should accepts the params with html format' do 
      post :create, params: {
        user: user_params,
      }
      
      expect(response.media_type).to eq('text/html')
       expect(response.content_type).to eq('text/html; charset=utf-8')
    end
    
    it 'should redirect to user showpage with html format' do 
      post :create, params: {
        user: user_params
      }
      expect(subject).to redirect_to(assigns(:user))
    end

    it 'should render the user partial with turbo_stream format' do 
      post :create, params: {
        user: user_params,
        format: :turbo_stream
      }
      expect(response).to render_template('users/_user')
    end

    it 'should renders the validation errors into form' do 
      post :create, params: {
        user: {
          name: nil,
          email: nil,
          password: 'password@123',
          contact_number: Faker::PhoneNumber.cell_phone_with_country_code,
          country: User.country_code_list.sample,
          state: 'MP',
          city: 'Indore'
        },
        format: :turbo_stream
      }
      expect(assigns(:user).valid?).to_not eq(true)
      expect(response).to render_template('users/_modal')
    end

    it 'should includes the error messages for empty attributes' do 
      post :create, params: {
        user: {
          name: nil,
          email: nil,
          password: 'password@123',
          contact_number: Faker::PhoneNumber.cell_phone_with_country_code,
          country: User.country_code_list.sample,
          state: 'MP',
          city: 'Indore'
        },
        format: :turbo_stream
      }
      expect(assigns(:user).valid?).to_not eq(true)
      expect(response).to render_template('users/_modal')
      expect(assigns(:user).errors.full_messages).to include("Email can't be blank", "Name can't be blank")
    end
    
    it 'should includes the uniqueness error in form' do 
      post :create, params: {
        user: {
          name: Faker::Name.name_with_middle,
          email: user.email,
          password: 'password@123',
          contact_number: Faker::PhoneNumber.cell_phone_with_country_code,
          country: User.country_code_list.sample,
          state: 'MP',
          city: 'Indore'
        },
        format: :turbo_stream
      }
      expect(assigns(:user).valid?).to_not eq(true)
      expect(response).to render_template('users/_modal')
      expect(assigns(:user).errors.full_messages).to include("Email has already been taken")
    end
  end

  describe 'PATCH update' do 
    let(:user) { create :user }
    let(:user1) { create :user }
    let(:user2) { create :user }

    before(:each) do 
      sign_in(user)
    end

    it 'should accepts the params with turbo_stream format' do 
      patch :update, params: {
        user: user_params,
        id: user1.id,
        format: :turbo_stream
      }
      
      expect(response.media_type).to eq('text/vnd.turbo-stream.html')
      expect(response.content_type).to eq('text/vnd.turbo-stream.html; charset=utf-8')
    end

    it 'should accepts the params with html format' do 
      patch :update, params: {
        user: user_params,
        id: user1.id
      }
      
      expect(response.media_type).to eq('text/html')
       expect(response.content_type).to eq('text/html; charset=utf-8')
    end
    
    it 'should redirect to user showpage with html format' do 
      patch :update, params: {
        user: user_params,
        id: user1.id
      }
      expect(subject).to redirect_to(assigns(:user))
    end

    it 'should render the user partial with turbo_stream format' do 
      patch :update, params: {
        user: user_params,
        id: user1.id,
        format: :turbo_stream
      }
      expect(response).to render_template('users/_user')
    end

    it 'should renders the validation errors into form' do 
      patch :update, params: {
        user: {
          name: nil,
          email: nil,
          password: 'password@123',
          contact_number: Faker::PhoneNumber.cell_phone_with_country_code,
          country: User.country_code_list.sample,
          state: 'MP',
          city: 'Indore'
        },
        id: user1.id,
        format: :turbo_stream
      }
      expect(assigns(:user).valid?).to_not eq(true)
      expect(response).to render_template('users/_modal')
    end

    it 'should includes the error messages for empty attributes' do 
      patch :update, params: {
        user: {
          name: nil,
          email: nil,
          password: 'password@123',
          contact_number: Faker::PhoneNumber.cell_phone_with_country_code,
          country: User.country_code_list.sample,
          state: 'MP',
          city: 'Indore'
        },
        id: user1.id,
        format: :turbo_stream
      }
      expect(assigns(:user).valid?).to_not eq(true)
      expect(response).to render_template('users/_modal')
      expect(assigns(:user).errors.full_messages).to include("Email can't be blank", "Name can't be blank")
    end
    
    it 'should includes the uniqueness error in form' do 
      patch :update, params: {
        user: {
          name: Faker::Name.name_with_middle,
          email: user.email,
          password: 'password@123',
          contact_number: Faker::PhoneNumber.cell_phone_with_country_code,
          country: User.country_code_list.sample,
          state: 'MP',
          city: 'Indore'
        },
        id: user1.id,
        format: :turbo_stream
      }
      expect(assigns(:user).valid?).to_not eq(true)
      expect(response).to render_template('users/_modal')
      expect(assigns(:user).errors.full_messages).to include("Email has already been taken")
    end
  end

  describe 'DELETE destroy' do 
    let(:user) { create :user }
    let(:user1) { create :user }

    before(:each) do 
      sign_in(user)
    end
    
    it 'should reduce the user count by one' do 
      delete :destroy, params: {
        id: user1.id,
        format: :turbo_stream
      }
      expect(User.count).to eq(1)
    end

    it 'should not render any template with turbo_stream format' do
      delete :destroy, params: {
        id: user1.id,
        format: :turbo_stream
      }
      expect(response).to render_template(nil)
    end

     it 'should redirect to users imdex page after deleting a user' do 
      delete :destroy, params: {
        id: user1.id
      }
      expect(subject).to redirect_to(users_path)
    end    
  end

  describe 'GET Show' do 
    let(:user) {create :user}
    let(:user1) { create :user}

    before(:each) do 
      sign_in(user)
    end

    it "should render the show template of user" do 
      get :show, params: {
        id: user1.id,
        format: :turbo_stream
      }
      expect(response).to render_template('users/show')
      expect(response.media_type).to eq('text/vnd.turbo-stream.html')
      expect(response.content_type).to eq('text/vnd.turbo-stream.html; charset=utf-8')
    end
  end

  describe 'GET Edit' do 
    let(:user) {create :user}
    let(:user1) { create :user}

    before(:each) do 
      sign_in(user)
    end

    it "should render the Edit template of user" do 
      get :edit, params: {
        id: user1.id,
        format: :turbo_stream
      }
      expect(response).to render_template('users/edit')
      expect(response.media_type).to eq('text/vnd.turbo-stream.html')
      expect(response.content_type).to eq('text/vnd.turbo-stream.html; charset=utf-8')
    end
  end

  describe 'GET New' do 
    let(:user) {create :user}
    let(:user1) { create :user}

    before(:each) do 
      sign_in(user)
    end

    it "should render the New template of user" do 
      get :new, params: {
        format: :turbo_stream
      }
      expect(response).to render_template('users/new')
      expect(response.media_type).to eq('text/vnd.turbo-stream.html')
      expect(response.content_type).to eq('text/vnd.turbo-stream.html; charset=utf-8')
    end
  end

  def user_params
    {
      name: Faker::Name.name_with_middle,
      email: Faker::Internet.email,
      password: 'password@123',
      contact_number: Faker::PhoneNumber.cell_phone_with_country_code,
      country: User.country_code_list.sample,
      state: 'MP',
      city: 'Indore'
    }
  end

end
