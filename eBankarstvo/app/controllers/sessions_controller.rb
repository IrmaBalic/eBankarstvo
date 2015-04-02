class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
	if user and user.authenticate(params[:password])
		session[:user_id] = user.id
    session[:role] = user.role.name
    if(session[:role] == "Guest")
      redirect_to user_url(user)
    else
		  redirect_to incidents_url
    end
	else
		redirect_to login_url, alert: "Invalid user/password combination"
	end

  end

  def destroy
  	session[:user_id] = nil
    session[:role] = nil
  	redirect_to incidents_url, notice: "Logged out"
  end
end
