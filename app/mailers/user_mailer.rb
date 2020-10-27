class UserMailer < ApplicationMailer
    def registration_confirmation
        @user = params[:user]
        mail(to: "#{@user.email}", subject: "Register Your Account")
    end

    def forgot_password
        @user = params[:user]
        @temporary_password = params[:temp_pass]
        mail(to: "#{@user.email}", subject: "Resetting Your Password")
    end

    def changed_password
        @user = params[:user]
        mail(to: "#{@user.email}", subject: "Your Password has been Changed")
    end
end
