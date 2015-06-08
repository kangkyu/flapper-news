class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Rails is serving our AngularJS application instead of the default Rails landing page.
  # We can do this by creating an action in ApplicationController which will only render the layout,
  # and then route requests to the root of our Rails app to that action.
  def index
    render 'layouts/application'  
  end
end
