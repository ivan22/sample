require 'spec_helper'

describe 'Create Product Workflow' do
  it 'creates and displays a list of products' do
    visit '/categories/new'
    page.should have_content 'Create Category'

    fill_in 'Title', with: 'Programming books'
    click_on 'Create Category'

    page.should have_content 'Category created successfully'

    visit '/products/new'
    page.should have_content 'Create New Product'

    fill_in 'Title', with: 'Ruby book'
    fill_in 'Price', with: 15.99
    fill_in 'Description', with: 'This is a great book!'
    select 'Programming books'

    click_on "Create Product"
    page.should have_content 'Product created successfully!'

    visit '/products'
    page.should have_content 'Product Listing'
    page.should have_content 'Ruby book'
  end
end
