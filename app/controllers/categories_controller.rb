class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.create!(params.require(:category).permit(:title))
    redirect_to new_category_url, notice: 'Category created successfully'
  end
end
