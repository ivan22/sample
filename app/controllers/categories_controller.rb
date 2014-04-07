class CategoriesController < ApplicationController
  def new
  end

  def create
    category = Category.create!(params.require(:category).permit(:title))
    redirect_to new_category_url
  end
end
