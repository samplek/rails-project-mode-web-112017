class CategoriesController < ApplicationController

  def index
    if params[:page_num]
      min = params[:page_num] * 10
      @categories = Catergory.all[-2..-1]
    else
      @categories = Category.all[0..9]
    end
  end

  def show
    @category = Category.find(params[:id])
    params[:page_num] ||= "10"

    if params[:page_num]
      @page = params[:page_num].to_i
      @posts = @category.posts[@page-10..@page]
    else
      @posts = @category.posts[0..9]
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      flash[:error] = @category.errors.full_messages
      redirect_to new_category_path
    end

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to(request.env['HTTP_REFERER'])
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :market)
  end

end
