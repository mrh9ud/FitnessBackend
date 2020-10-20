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
            error_messages = {}
            user.errors.messages.each do |message|
                print "attribute: #{message[0]}; message: #{message[1][0]} "
                error_messages['message'] = message[1][0]
            end
            render json: { error: true, message: error_messages }, status: :not_acceptable
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.valid?
            render json: user.as_json(except: [:updated_at, :created_at, :password_digest]), status: :accepted
        else
            error_messages = {}
            user.errors.messages.each do |message|
                print "attribute: #{message[0]}; message: #{message[1][0]} "
                error_messages['message'] = message[1][0]
            end
            render json: { error: true, message: error_messages }, status: :not_acceptable
        end
    end

    def profile
        token = request.headers["Authentication"]
        payload = decode(token)
        user = User.find(payload["user_id"])
        render json: user.as_json(except: [:updated_at, :created_at, :password_digest])
    end

    private

    def user_params
        params.require(:user).permit(:id, :username, :password, :first_name, :last_name, :email)
    end
end