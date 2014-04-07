class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(create_params)

    if @category.save
      redirect_to new_category_url, notice: 'Category created successfully'
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:category).permit(:title)
  end
end
