class Api::V1::AuthController < ApplicationController
   def create
      user = User.find_by(username: params[:username])
      if user
         if (!user.email_confirmed)
            render json: {
               error: true,
               message: "Please check your email to register your account before logging in"
            }
         elsif user.authenticate(params[:password])
            token = encode(user_id: user.id)
            render json: {
               user: user.as_json(except: [:updated_at, :created_at, :password_digest]),
               jwt: token
            }, status: :accepted
         else
            render json: {
               error: true,
               message: "Incorrect Password"
            }, status: :unauthorized
         end

      else
         render json: {
            error: true,
            message: "Invalid Username"
         }, status: :bad_request
      end

   end
end
