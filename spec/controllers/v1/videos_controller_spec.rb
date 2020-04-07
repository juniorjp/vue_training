require 'rails_helper'

RSpec.describe V1::VideosController, type: :controller do
  
  describe 'GET #index' do
    render_views
    let!(:user) { create(:user) }

    let!(:videos) do
      create_list(:video, 25)
    end
    it 'returns http success with a list of videos' do
      @request.headers['api_version'] = 'v1'
      authorization_info = {
          sub: user.uuid,
      }
      token = JWT.encode authorization_info, Rails.application.secrets.secret_key_base, 'HS256'
      @request.headers['Authorization'] = token
      get :index, format: :json

      expect(response).to have_http_status(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.map{|el| el["title"]}).to eq(Video.all.pluck(:title))
    end
  end
end
