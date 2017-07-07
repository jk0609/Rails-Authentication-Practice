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
    visit category_product_path(@category, @product)

  end

  it "adds a new review" do
    fill_in 'review[body]', :with => "lorem ipsum"
    click_on 'Create Review'
    expect(page).to have_content 'lorem ipsum'
  end

  # Add delete specs once you can get capybara to click on pop ups
end
