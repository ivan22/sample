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
end
