class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_user
  def find_user
    if session[:user_id]
      puts "Session id: #{session[:user_id]}"
      u = User.find(session[:user_id])
      puts "User id: #{u.id}"
      
      @user = User.find_by(id: session[:user_id])
    end
  end
end
