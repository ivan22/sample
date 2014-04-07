require 'spec_helper'

describe 'Create Categories Workflow' do
  it 'creates a category' do
    visit 'categories/new'
    page.should have_content 'Create Category'

    fill_in 'Title', with: 'Programming books'
    click_on 'Create Category'

    page.should have_content 'Category created successfully'
  end
end
