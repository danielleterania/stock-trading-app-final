class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.email == 'admin@example.com'
      admin_users_path # Redirect to the admin users index page or another admin path
    elsif resource.user_type == 'trader'
      stocks_path # Redirect to the trader's portfolio page
    else
      root_path # Redirect to a general path
    end
  end
end
