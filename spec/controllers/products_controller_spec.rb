require 'spec_helper'

describe ProductsController do
  describe '#index' do
    def do_request
      get :index
    end

    it 'should display the list of products' do
      do_request
      assigns(:products).should_not be_nil
      response.should render_template :index
    end
  end

  describe '#new' do
    def do_request
      get :new
    end

    it 'should display the new form' do
      do_request
      response.should render_template :new
    end
  end

  describe '#create' do
    def do_request
      category = Category.create!(title: '123')
      post :create, { product: {title: '123', description: '123', price: 15.99, category_id: category.id} }
    end

    it 'should create the product' do
      expect { do_request }.to change(Product, :count).by(1)
      response.should redirect_to new_product_url
    end
  end
end
