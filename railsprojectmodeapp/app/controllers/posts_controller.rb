class PostsController < ApplicationController
  def index
    @posts = Post.top_posts(Post.normal_posts)
    if params[:type]

      if params[:type] == 'market'
        @type = 'market'
        @posts = Post.top_posts(Post.market_posts)
      end

    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.category = Category.find_by(name: params[:post][:category])

    if @post.save
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :post_type, :link, :user_id)
  end
end
