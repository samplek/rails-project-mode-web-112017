class ModCategoriesController < ApplicationController


  def create

    if current_user.moderator == true
      @mod_category = ModCategory.create(category_id: params[:category_id], user_id: params[:user_id])
      redirect_to '/modrequest'
    else
      flash[:error] = "You will need to contact an administrator to request mod status for #{Category.find(params[:category_id]).name}."
      redirect_to '/modrequest'
    end
  end

  def destroy
    @modcategory = ModCategory.find_by(category_id: params[:category_id], user_id: params[:user_id])
    @modcategory.destroy
    redirect_to(request.env['HTTP_REFERER'])
  end

  private

  def mod_params
    params.require(:mod_categories).permit(:category_id, :user_id)
  end
end
