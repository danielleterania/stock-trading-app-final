class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.email == 'admin@example.com'
      admin_users_path # Redirect to the admin users index page or another admin path
    else
      root_path # Redirect to trader home or a general path
    end
  end
end
