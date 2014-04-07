require 'spec_helper'

describe ProductsController do
  describe '#new' do
    it 'should display the new form' do
      get :new
      response.should render_template :new
    end
  end

  describe '#create' do
    it 'should create the product' do
      expect {
        post :create, { product: {title: '123', description: '123', price: 15.99} }
      }.to change(Product, :count).by(1)
      response.should redirect_to new_product_url
    end
  end
end
