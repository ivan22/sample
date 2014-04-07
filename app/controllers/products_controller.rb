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

    if @product.save
      redirect_to new_product_url, notice: 'Product created successfully!'
    else
      @categories = Category.all
      render :new
    end
  end

  private

  def create_params
    params.require(:product).permit(:title,
                                    :description,
                                    :price,
                                    :category_id)
  end
end
