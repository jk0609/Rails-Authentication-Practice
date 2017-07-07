class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    current_user.reviews.push(@review)
    @review.save
    redirect_to category_product_path(@product.category, @product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to category_product_path(@product.category, @product)
  end

private
  def review_params
    params.require(:review).permit(:body)
  end

end
