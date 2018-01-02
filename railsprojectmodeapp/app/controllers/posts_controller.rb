class PostsController < ApplicationController
  def index

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :type, :link, :category_id, :user_id)
  end
end
