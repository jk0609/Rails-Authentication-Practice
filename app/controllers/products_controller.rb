class ProductsController < ApplicationController

    def show
      @category = Category.find(params[:category_id])
      @product = Product.find(params[:id])
      @review = Review.new
    end

    def new
      @category = Category.find(params[:category_id])
      @product = Product.new
    end
    def create
      @category = Category.find(params[:category_id])
      @product = @category.products.new(product_params)
      if @product.save
        flash[:notice] = "Product saved!"
        redirect_to  category_path(@category)
      else
        render :new
      end
    end

    def edit
      @category = Category.find(params[:category_id])
      @product = Product.find(params[:id])
    end
    def update
      @category = Category.find(params[:category_id])
      @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:notice] = "Product updated!"
        redirect_to  category_product_path(@category, @product)
      else
        render :edit
      end
    end

    def destroy
      @category = Category.find(params[:category_id])
      @product = Product.find(params[:id])
      @product.reviews.each do |review|
        review.destroy
      end

      @product.destroy
      redirect_to category_path(@category)
    end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end


end
