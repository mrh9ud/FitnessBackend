class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode({ user_id: @user.id })
      UserMailer.with(user: @user).registration_confirmation.deliver_now
      render json: { message: "Please confirm your email address to continue" }
    else
      error_messages = {}
      @user.errors.messages.each do |message|
        print "attribute: #{message[0]}; message: #{message[1][0]} "
        error_messages['message'] = message[1][0]
      end
      render json: { error: true, message: error_messages }, status: :not_acceptable
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user.as_json(only: [:id, :username, :first_name, :last_name, :email]), status: :accepted
    else
      error_messages = {}
      user.errors.messages.each do |message|
        print "attribute: #{message[0]}; message: #{message[1][0]} "
        error_messages['message'] = message[1][0]
      end
      render json: { error: true, message: error_messages }, status: :not_acceptable
    end
  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:id])
    if @user
      @user.activate_email
      @user.save!(validate: false)
      render html: "<h1>Registration Successful!</h1><h2>Open fitnessApp on your device and login.</h2>".html_safe
    end
  end

  def profile
    token = request.headers["Authentication"]
    payload = decode(token)
    user = User.find(payload["user_id"])
    render json: user.as_json(only: [:id, :username, :first_name, :last_name, :email]), status: :accepted
  end
 
  def reset_password
    user = User.find_by(username: params[:user][:username])
    if user
      seconds_since_reset_email = Time.now.utc - user.reset_password_sent_at
      if (seconds_since_reset_email / 1.hour) > 2
        render json: { 
          expired: true, 
          user_data: { username: user.username, email: user.email },
          message: "Your recovery token has expired (over 2 hours have passed). Would you like us to send you a new temporary password?" 
        }
      else
        if user.update(user_params)
          user.update(confirm_token: nil, resetting_password: false, reset_password_sent_at: nil)
          token = encode({ user_id: user.id })
          render json: {
            user: user.as_json(only: [:id, :username, :first_name, :last_name, :email]),
            jwt: token
          }, status: :accepted
        else
          render json: { error: true, message: "unable to set new password" }
        end
      end
    else
      render json: { error: true, message: "username not found" }
    end
  end

  def change_password
    @user = User.find(params[:user][:id])
    if @user
      @user.update(password: params[:user][:password])
      UserMailer.with(user: @user).changed_password.deliver_now
      render json: { error: false, message: "Your password has been successfully changed." }, status: :accepted
    else
      render json: { error: true, message: "User not found. Try again."}
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :password, :first_name, :last_name, :email, :email_confirmed)
  end
end
