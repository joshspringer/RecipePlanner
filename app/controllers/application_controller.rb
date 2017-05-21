class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def home
    @featured = []
    render '/index.html.erb'
  end
end
