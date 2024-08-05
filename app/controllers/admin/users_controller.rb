# app/controllers/admin/users_controller.rb
module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def approve
      @user = User.find(params[:id])
      @user.approve!
      UserMailer.with(user: @user).account_approved.deliver_later
      redirect_to admin_users_path, notice: 'User was successfully approved.'
    end

    private

    def user_params
      params.require(:user).permit(:username, :status)
    end

    def authorize_admin
      unless current_user.email == 'admin@example.com'
        redirect_to root_path, alert: 'Access denied.'
      end
    end
  end
end
