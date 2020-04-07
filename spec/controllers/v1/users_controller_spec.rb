require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  
  describe 'POST #create' do
    render_views

    it 'returns http success with a new user model' do
      @request.headers['api_version'] = 'v1'
      post :create, params: {}, format: :json
      expect(response).to have_http_status(200)
      expect(User.count).to eq(1)
      user = User.last
      parsed_response = JSON.parse(response.body)
      token = parsed_response["token"]
      data = HashWithIndifferentAccess.new JWT.decode(token, Rails.application.secrets.secret_key_base).first
      user_uuid = data[:sub]
      expect(user_uuid).to eq(user.uuid)
    end
  end
end
