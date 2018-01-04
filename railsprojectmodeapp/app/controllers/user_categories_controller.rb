class UserCategoriesController < ApplicationController

  def create
    UserCategory.find_or_create_by(category_id: params[:category_id], user_id: params[:user_id])
    redirect_to(request.env['HTTP_REFERER'])
  end

  def destroy
    @user_category = UserCategory.find_by(category_id: params[:category_id], user_id: params[:user_id])
    @user_category.destroy
    redirect_to(request.env['HTTP_REFERER'])
  end

end
