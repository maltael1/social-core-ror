class Api::V1::ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate

    private

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        @session = Session.find_by(token: Digest::MD5.hexdigest(token))
        render json: {error: 'Invalid token'}, status: :forbidden if @session.nil?
        render json: {error: 'Token lifetime expired '}, status: :forbidden unless @session.active?
        @user = @session.user
        @session.save!
      end
    end
end
