require 'spec_helper'

describe ProductsController do
  describe '#new' do
    it 'should display the new form' do
      get :new
      response.should render_template :new
    end
  end
end
