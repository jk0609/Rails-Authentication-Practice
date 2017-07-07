require 'rails_helper'

describe "Categories" do

  before(:each) do
    Category.destroy_all
    Product.destroy_all
    @user = FactoryGirl.create(:user, :admin=>true)
    login_as(@user, :scope=>:user)
    FactoryGirl.create(:category)
    visit categories_path
  end

  it "adds a new category" do
    click_on 'Add Category'
    fill_in 'Name', :with => "Test2"
    click_button 'Create Category'
    expect(page).to have_content 'Test2'
  end

  it "shows category detail" do
    click_on 'test'
    expect(page).to have_content 'Products'
  end

  it "updates categories" do
    click_on 'test'
    click_on 'Edit Category'
    fill_in 'Name', :with => "Test3"
    click_on 'Update Category'
    expect(page).to have_content 'Test3'
  end
  
  # Add delete specs once you can get capybara to click on pop ups
end
