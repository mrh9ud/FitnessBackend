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
    render json: user.as_json(except: [:updated_at, :created_at, :password_digest])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :email_confirmed)
  end
end