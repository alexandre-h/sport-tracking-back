class AuthController < ApplicationController
  before_action :authenticate_user!, only: [:check_token]

  def check_token
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key], true, { algorithm: 'HS256' })[0]
    exp = decoded_token['exp']
    if exp < Time.now.to_i
      render json: { valid: false, message: 'Token has expired' }, status: :unauthorized
    else
      render json: { valid: true, message: 'Token is valid' }
    end
  rescue JWT::DecodeError
    render json: { valid: false, message: 'Invalid token' }, status: :unauthorized
  end
end
