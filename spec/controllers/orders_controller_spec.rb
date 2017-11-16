require 'rails_helper'

describe OrdersController, type: :controller do
  context 'GET #index' do
    before do
      @user1 = FactoryGirl.create(:admin)
      @user2 = FactoryGirl.create(:user)
    end

    it "allows admin to view page" do
      sign_in(@user1)
      get :index
      expect(response).to have_http_status(200)      # or
      # expect(response).to render_template('index')
    end

    # it "doesnt allow non admin user to view page" do
    #   sign_in(@user2)
    #   get :index
    #   expect(response).to redirect_to(new_user_session_path)
    # end
  end

end