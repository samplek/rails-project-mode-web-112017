class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  helper_method :make_user, :guest_categories, :signedin_categories

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def make_user
    User.new
  end

  def guest_categories
    Category.top_catagories.take(10)
  end

  def signedin_categories
    Category.top_user_catagories(current_user).take(10)
  end

end
