class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # Skip session storage
  before_action :skip_session_storage
  protect_from_forgery with: :null_session


  def create
    self.resource = warden.authenticate!(auth_options)
    if resource
      sign_in(resource_name, resource)
      token = current_token
      render json: { message: 'Logged in successfully.', user: resource, token: token }, status: :ok
    else
      render json: { message: 'Invalid login credentials.' }, status: :unauthorized
    end
  end

  private

  def skip_session_storage
    request.session_options[:skip] = true
  end

  def respond_to_on_destroy
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
