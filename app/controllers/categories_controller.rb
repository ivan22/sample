class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.create!(create_params)
    redirect_to new_category_url, notice: 'Category created successfully'
  end

  private

  def create_params
    params.require(:category).permit(:title)
  end
end
