class Api::AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:register, :login]

  # Register User
  def register
    user = User.new(user_params)
    if user.save
      render json: { message: "Registration successful. Please log in.", user: user }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Login User
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: { user: user, token: generate_token(user) }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def generate_token(user)
    JWT.encode({ user_id: user.id }, Rails.application.secret_key_base, 'HS256')
  end
end
