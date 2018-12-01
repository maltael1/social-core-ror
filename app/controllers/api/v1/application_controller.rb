class Api::V1::ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate

    private

    def authenticate
        authenticate_with_http_token do |token, options|
          @user = User.find_by(token: token)
        end
        render json: {error: 'Application not ready'}, status: 405 if (@user.nil? || !@user.is_admin) && Feature.not('app_is_ready')   end
end
