class Api::V1::ApiController < ActionController::Base
  # before_action :check_read_only

  def authenticate
    unauthorized unless current_user
  end

  def current_user
    if access_token.present?
      @current_user ||= User.find_by_auth_token(access_token)
    end
  end

  def access_token
    return request.headers['Authorization']
  end

  def unauthorized
    render json: {error: 'Unauthorized'}, status: 401
  end

  def not_found
    render json: {error: 'not found'}, status: 404
  end

  def no_record
    render json: {error: 'no matching record'}, status: 404
  end


  def validate_guest_token
    gt = GuestToken.find_by_token(access_token)
    if ((gt.present?) && (!gt.expired?))
      return true 
    else
      render json: {error: 'token expired'}, status: 401
    end
  end
  
end