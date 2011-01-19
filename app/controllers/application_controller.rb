class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate_admin!
    redirect_to root_url, :notice => "Authentication failure" unless current_user.admin?
  end
end
