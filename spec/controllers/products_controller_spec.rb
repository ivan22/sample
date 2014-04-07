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
      post :create, params
    end

    let!(:category) { create(:category) }

    context 'Success' do
      let!(:params) { { product: attributes_for(:product, category_id: category.id) } }

      it 'should create the product' do
        expect { do_request }.to change(Product, :count).by(1)
        response.should redirect_to new_product_url
      end
    end

    context 'failure' do
      let!(:params) { { product: attributes_for(:product, category_id: category.id, description: '') } }

      it 'should not create the product' do
        expect { do_request }.to_not change(Product, :count)
        response.should render_template :new
      end
    end
  end

  describe '#edit' do
    def do_request
      get :edit, id: product.id
    end

    let!(:product) { create(:product) }

    it 'should display an update form' do
      do_request
      assigns(:product).id.should == product.id
      response.should render_template :new
    end
  end

  describe '#update' do
    def do_request
      patch :update, product_params
    end

    let!(:product) { create(:product) }
    let!(:product_params) { {product: attributes_for(:product, description: 'New description'), id: product.id} }

    context 'Success' do

      it 'should update the product' do
        do_request
        assigns(:product).description.should == 'New description'
        response.should redirect_to products_url
      end
    end

    context 'Failure' do
      let!(:product_params) { {product: attributes_for(:product, description: ''), id: product.id} }

      it 'should not update the product' do
        do_request
        product.reload.description.should_not == ''
        response.should render_template :new
      end
    end
  end
end
