class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.create!(comment_params)
    redirect_to(request.env['HTTP_REFERER'])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
