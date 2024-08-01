class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # code for index action
  end
  
  # other actions
end
