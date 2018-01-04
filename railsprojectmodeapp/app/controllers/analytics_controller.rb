class AnalyticsController < ApplicationController

  def index
    @users = User.all
    @posts = Post.all
    @comments = Comment.all
    @likes = Like.all
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

end
