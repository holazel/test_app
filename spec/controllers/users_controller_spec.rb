require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user1 = User.create!(email: "lodnjk@gmail.com", password: "dnjkds34")
    @user2 = User.create!(email: "dnjkdjknn@gmail.com", password: "5nfjd1")
  end

  describe 'GET #show' do

    context 'User is logged in' do
      before do
        sign_in @user1
      end
      
      it 'loads correct user details' do
        get :show, params: { id: @user1.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end

      it 'other users show page restricted' do
        get :show, params: { id: @user2.id }
        expect(response).to redirect_to(root_path)
      end
      
    end

     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, params: { id: @user2.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end

  end

end