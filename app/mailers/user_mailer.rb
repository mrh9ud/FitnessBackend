class UserMailer < ApplicationMailer
    def registration_confirmation
        @user = params[:user]
        mail(to: "#{@user.email}", subject: "Register Your Account")
    end
end
