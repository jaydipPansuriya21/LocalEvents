class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :set_default_response_format
    respond_to :json
    before_action :authenticate_user
    def set_default_response_format
        request.format = :json unless params[:format]
    end

    def authenticate_user
        if request.headers['Authorization'].present?
          authenticate_or_request_with_http_token do |token|
            begin
              jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    
              @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
              head :unauthorized
            end
          end
        end
    end

  def authenticate_user!(options = {})
      head :unauthorized unless signed_in?
  end

  def current_user
    begin
      @current_user ||= super || User.find(@current_user_id)
    rescue ActiveRecord::RecordNotFound => e
      @current_user ||= nil
    end

  end

  def signed_in?
    @current_user_id.present?
  end
end
