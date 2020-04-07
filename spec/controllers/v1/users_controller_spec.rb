require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  
  describe 'POST #create' do
    render_views
    let(:current_ip) { Faker::Internet.public_ip_v4_address  }

    it 'returns http success with a new parking model' do
      @request.headers['api_version'] = 'v1'
      post :create, params: {user: {current_ip: current_ip}}, format: :json
      expect(response).to have_http_status(200)
      expect(User.count).to eq(1)
      user = User.last
      expect(user.current_ip).to eq(current_ip)

      parsed_response = JSON.parse(response.body)
      token = parsed_response["token"]
      data = HashWithIndifferentAccess.new JWT.decode(token, Rails.application.secrets.secret_key_base).first
      user_uuid = data[:sub]
      expect(user_uuid).to eq(user.uuid)
    end
  end
end
