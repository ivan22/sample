class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :price))
    @product.save!
    redirect_to new_product_url, notice: 'Product created successfully!'
  end
end
