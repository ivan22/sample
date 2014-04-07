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

  def edit
    @product = Product.find(product_id)
    render :new
  end

  def update
    @product = Product.find(product_id)

    if @product.update(update_params)
      redirect_to products_url
    else
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
  alias_method :update_params, :create_params

  def product_id
    params.require(:id)
  end
end
