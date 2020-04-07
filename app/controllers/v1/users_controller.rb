module V1
  class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      @user.uuid = SecureRandom.uuid
      generate_token

      if @user.save
        render :user_info
      else
        head :bad_request
      end
    end

    private

    def user_params
      params.require(:user).permit(:current_ip)
    end

    def generate_token
      payload = {
        sub: @user.uuid,
        exp: 1.month.from_now.to_i
      }
      @token = JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
    end
  end
end
