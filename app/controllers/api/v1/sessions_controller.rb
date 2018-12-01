class Api::V1::SessionsController < Api::V1::ApplicationController
    skip_before_action :authenticate

    def create 
        @user = User.find_by_email_and_password(params[:email], Digest::MD5.hexdigest(params[:password]))
        if @user.present?
            render json: {token: @user.token}
        else
            ender json: {error: "Invalid login or password"}, status: :forbidden
        end
    end
end
