class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to(request.env['HTTP_REFERER'])
    else
      flash[:error] = "Username and passwowrd do not match"
      redirect_to new_session_path
    end

  end

  def destroy
    session.delete :user_id
    redirect_to categories_path
  end

end
