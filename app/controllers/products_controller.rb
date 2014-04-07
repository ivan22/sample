class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :price, :category_id))
    @product.save!
    redirect_to new_product_url, notice: 'Product created successfully!'
  end
end
