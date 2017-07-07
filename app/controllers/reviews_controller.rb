class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]
  before_action :only => [:delete] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end
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
