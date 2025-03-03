class UsersController < ApplicationController
    def show
      render json: @current_user, status: :ok
    end
  
    def update
      if @current_user.update(user_params)
        render json: @current_user, status: :ok
      else
        render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @current_user.destroy
      render json: { message: "Account deleted successfully" }, status: :ok
    end
  
    private
  
    def user_params
      params.permit(:name, :email, :password)
    end
  end
  