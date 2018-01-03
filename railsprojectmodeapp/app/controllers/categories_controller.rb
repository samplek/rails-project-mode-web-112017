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


  
end
