class Api::V1::UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid?
            token = encode({ user_id: user.id })
            render json: {
                jwt: token,
                currentUser: user.as_json(except: [:updated_at, :created_at, :password_digest])
            }, status: :created
        else
            render json: { error: "form inputs unable to validate; user creation failed" }, status: :not_acceptable
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
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end
end