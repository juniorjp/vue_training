module V1
  class UsersController < ApplicationController
    def create
      @user = User.new(uuid: SecureRandom.uuid)
      generate_token

      if @user.save
        render :user_info
      else
        head :bad_request
      end
    end

    private

    def generate_token
      payload = {
        sub: @user.uuid,
        exp: 1.month.from_now.to_i
      }
      @token = JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
    end
  end
end
