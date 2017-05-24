class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

# moved to the recipes controller
  # def home
  #   @featured = [
  #     Recipe.find_by(id: 9384),
  #     Recipe.find_by(id: 7947),
  #     Recipe.find_by(id: 149),
  #     Recipe.find_by(id: 6148),
  #     Recipe.find_by(id: 10526),
  #     Recipe.find_by(id: 7067),
  #     Recipe.find_by(id: 10493),
  #     Recipe.find_by(id: 7252),
  #     Recipe.find_by(id: 315),
  #   ]
  #   @popular = [
  #     Recipe.find_by(id: 5370),
  #     Recipe.find_by(id: 5838),
  #     Recipe.find_by(id: 6893)
  #   ]
  #   render '/index.html.erb'
  # end

end
