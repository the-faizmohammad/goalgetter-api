class ApplicationController < ActionController::API
    before_action :authorize_request
    attr_reader :current_user
  
    def authorize_request
      header = request.headers['Authorization']
      token = header.split(' ').last if header
  
      begin
        decoded = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')[0]
        @current_user = User.find(decoded["user_id"])
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  end
  