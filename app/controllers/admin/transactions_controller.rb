module Admin
  class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @transactions = ::Transaction.all
    end

    private

    def authorize_admin
      unless current_user.user_type == 'admin'
        redirect_to root_path, alert: 'Access denied.'
      end
    end
  end
end
