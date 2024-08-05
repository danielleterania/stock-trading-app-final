# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
    default from: 'no-reply@example.com'
  
    def account_pending
      @user = params[:user]
      mail(to: @user.email, subject: 'Your account is pending approval')
    end
  
    def account_approved
      @user = params[:user]
      mail(to: @user.email, subject: 'Your account has been approved')
    end
  end
  