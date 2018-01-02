class LikesController < ApplicationController
  def create
    Like.find_or_create_by(post_id: params[:post_id], user_id: params[:user_id])
    redirect_to(request.env['HTTP_REFERER'])
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: params[:user_id])
    @like.destroy
    redirect_to(request.env['HTTP_REFERER'])
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
