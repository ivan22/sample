require 'spec_helper'

describe ProductsController do
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
      post :create, { product: {title: '123', description: '123', price: 15.99} }
    end

    it 'should create the product' do
      expect { do_request }.to change(Product, :count).by(1)
      response.should redirect_to new_product_url
    end
  end
end
