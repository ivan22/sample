require 'spec_helper'

describe CategoriesController do
  describe '#new' do
    it 'displays the category form' do
      get :new
      response.should render_template :new
    end
  end

  describe '#create' do
    def do_request
      post :create, category: attributes_for(:category)
    end

    context 'Success' do
      it 'creates a new category' do
        expect { do_request }.to change(Category, :count).by(1)
        response.should redirect_to new_category_url
      end
    end

    context 'failure' do
      def do_request
        post :create, category: attributes_for(:category, title: '')
      end

      it 'should not create a category' do
        expect { do_request }.to_not change(Category, :count)
        response.should render_template :new
      end
    end
  end
end
