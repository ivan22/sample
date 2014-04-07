require 'spec_helper'

describe CategoriesController do
  describe '#new' do
    it 'displays the category form' do
      get :new
      response.should render_template :new
    end
  end
end
