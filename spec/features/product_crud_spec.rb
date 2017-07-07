require 'rails_helper'

describe "Products" do

  before(:each) do
    Category.destroy_all
    Product.destroy_all
    @user = FactoryGirl.create(:user, :admin=>true)
    login_as(@user, :scope=>:user)
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product)
    @category.products.push(@product)
    visit category_path(@category)

  end

  it "adds a new product" do
    click_on 'Add Product'
    fill_in 'Name', :with => "Test2"
    fill_in 'Description', :with => "lorem ipsum"
    fill_in 'Price', :with => "5.00"
    click_button 'Create Product'
    expect(page).to have_content 'Product saved!'
  end

  it "shows product detail" do
    click_on 'test_product'
    expect(page).to have_content 'lorem ipsum'
  end

  it "updates products" do
    click_on 'test_product'
    click_on 'Edit Product'
    fill_in 'Name', :with => "Test3"
    fill_in 'Description', :with => "Lorem ipsum2"
    fill_in 'Price', :with => "10.00"
    click_on 'Update Product'
    expect(page).to have_content 'Test3'
  end

  # Add delete specs once you can get capybara to click on pop ups
end
