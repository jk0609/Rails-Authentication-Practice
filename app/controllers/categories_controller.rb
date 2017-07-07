class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Product saved!"
      redirect_to  categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category updated!"
      redirect_to  category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.products.each do |prod|
      prod.destroy
    end
    @category.destroy
    redirect_to categories_path
  end

private
  def category_params
    params.require(:category).permit(:name)
  end
end
