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
               user: user.to_json(
                  only: [:id, :username, :first_name, :last_name, :email, :resetting_password],
                  include: [
                     workouts: {
                        except: :updated_at,
                        include: [
                           exercises: { except: [:created_at, :updated_at] }
                        ]
                     }
                  ]
               ),
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

   def verify_email_username
      @user = User.find_by(username: params[:user][:username])
      if @user
         if @user.email == params[:user][:email]
            @temporary_password = SecureRandom.urlsafe_base64.to_s
            reset_password_time = Time.now.utc
            token = @user.confirmation_token
            @user.update(
               password: @temporary_password, 
               resetting_password: true,
               reset_password_sent_at: reset_password_time,
               confirm_token: token
            )
            UserMailer.with(user: @user, temp_pass: @temporary_password).forgot_password.deliver_now
            render json: { message: "Check your email for your temporary password"}
         else
            render json: {
               error: true,
               message: "Email does not match account"
            }
         end
      else
         render json: {
            error: true,
            message: "Username not found"
         }
      end
   end
end
