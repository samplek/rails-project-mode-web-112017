class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.create!(comment_params)
    redirect_to(request.env['HTTP_REFERER'])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(request.env['HTTP_REFERER'])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
