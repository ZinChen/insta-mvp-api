class Api::V1::SessionController < ApplicationController
  def user
    render json: current_user
  end

  def login
    user = User.find_by(email: user_params[:email], encrypted_password: Base64.encode64(user_params[:password]))
    raise AuthorizationError if user.nil?

    user.update(authentication_token: User.generate_unique_secure_token)

    render json: user, status: :ok
  rescue AuthorizationError
    error = {
      email: "Email or password is incorrect"
    }
    render json: { errors: error }, status: :unauthorized
  end

  def signup
    user = User.find_by(email: user_params[:email])
    raise AuthorizationError unless user.nil?

    user = User.create!(
      email: user_params[:email],
      name: user_params[:name],
      photo: User.create_photo,
      encrypted_password: Base64.encode64(user_params[:password]),
      authentication_token: User.generate_unique_secure_token
    )
    render json: user, status: :created
  rescue AuthorizationError
    error = {
      email: "Email is already taken"
    }
    render json: { errors: error }, status: :unauthorized
  rescue
    render json: user,
      adapter: :json_api,
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
