class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    user_show_path(resource)
  end
end


# Other way to use after_sign_in_path_for
# user_path(current_user)
#
# def after_sign_in_path_for(resource)
#  items_path
# end
