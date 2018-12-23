class Api::V1::SessionsController < Api::V1::ApplicationController
    skip_before_action :authenticate, :only => [:create]

    def create
        @user = User.find_by_email_and_password(params[:email], Digest::MD5.hexdigest(params[:password]))
        if @user.present?
            token = SecureRandom.hex
            @user.sessions.create(token: token)
            render json: {token: token}
        else
            render json: {error: "Invalid login or password"}, status: :forbidden
        end
    end

    def destroy 
        @session.deactivate
    end

    def index 
        head :ok
    end
end
