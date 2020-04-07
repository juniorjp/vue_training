class ApplicationController < ActionController::Base

  def authenticate_user
    data = HashWithIndifferentAccess.new JWT.decode(request.env['HTTP_AUTHORIZATION'].split(' ').last, Rails.application.secrets.secret_key_base).first
    params[:uid] = data[:sub]
  rescue JWT::ExpiredSignature
    head 403
  rescue => e
    head 401
  end
end
