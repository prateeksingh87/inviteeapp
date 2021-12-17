class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate, except: [:signin, :signup, :get_user_remember_token]
  #before_action :validate_user, only: [:create, :update, :change_roles]
  skip_before_action :verify_authenticity_token  

  def signup
    user = User.new(user_params)
    user.generate_auth_token!
    if user.save
      sign_in :user, user
      @current_user = user
      render json: {user: user.custom_json},status: 200
    else
      render json: {error: user.errors.full_messages },status: 400
    end
  end

  def get_user_remember_token
    return not_found unless params[:remember_token]
    user = User.find_by(remember_token: params[:remember_token])
    if user.present?
      sign_in :user, user
      @current_user = user
      render json: {user: user.custom_json },status: 200
    else
      render json: {error: "Token is expired" },status: 400
    end
  end

  def signin
    user = User.find_by(email: params[:email].downcase)
    if user.present? and user.valid_password? params[:password] 
      sign_in :user, user
      @current_user = user
      user.remember_me!  if params[:remember_me]
      render json: {user: user.custom_json },status: 200
    else
      render json: { error: 'Incorrect email or password' }, status: 400
    end
  end

  def signout
    current_user.update_attributes(auth_token: "")
    current_user.forget_me!
    sign_out :user
    render json: {success: "successfully logged out"},status: 200
  end

  def check_email
    render json: {email_exist?: User.find_by(email: params[:email]).present?}, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company_id)
  end

  def user_check
    render json: {error: "Please contact the administrator." },status: 401
  end
end