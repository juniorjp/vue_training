require 'rails_helper'

RSpec.describe V1::VotesController, type: :controller do
  
  describe 'POST #create' do
    render_views
    let!(:user) { create(:user) }
    let!(:video) { create(:video) }

    it 'returns http success with and increase user_vote count' do
      @request.headers['api_version'] = 'v1'
      authorization_info = {
        sub: user.uuid,
      }
      token = JWT.encode authorization_info, Rails.application.secrets.secret_key_base, 'HS256'
      @request.headers['Authorization'] = token
      post :create, params: {video_id: video.id}, format: :json

      expect(response).to have_http_status(200)
      expect(video.reload.user_votes.size).to eq(1)
    end
  end
end
