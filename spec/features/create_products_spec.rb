require 'spec_helper'

describe 'Create Product Workflow' do
  it 'allows user to create a product' do
    visit 'products/new'
    page.should have_content 'Create New Product'

    fill_in 'Title', with: 'Ruby book'
    fill_in 'Price', with: 15.99
    fill_in 'Description', with: 'This is a great book!'

    click_on "Create Product"
    page.should have_content 'Product created successfully!'
  end
end
