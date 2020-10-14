class Api::V1::UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: { user: UserSerializer.new(@user) }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:id, :username, :password, :first_name, :last_name, :email)
    end
end
