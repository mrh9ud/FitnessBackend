class Api::V1::UsersController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: { user: UserSerializer.new(@user) }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def profile
        token = request.headers["Authentication"]
        payload = decode(token)
        user = User.find(payload["user_id"])

        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:id, :username, :password, :first_name, :last_name, :email)
    end
end
