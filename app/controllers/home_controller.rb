class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index] # or any other actions

  def index
    # code for index action
  end
  
  # other actions
end
