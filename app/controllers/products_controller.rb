class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(create_params)
    @product.save!
    redirect_to new_product_url, notice: 'Product created successfully!'
  end

  private

  def create_params
    params.require(:product).permit(:title,
                                    :description,
                                    :price,
                                    :category_id)
  end
end
