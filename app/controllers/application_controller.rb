class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Define always auth
  before_action :authenticate_user!

end
