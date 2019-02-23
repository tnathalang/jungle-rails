class ReviewsController < ApplicationController
  def new
  end

  def create
    product = Product.find(paramns[:product_id])
    review = Review.new(review_params)
    review.product = product

    product.review.new(review_params)
    
    if review.save
      #/products/:id/
      redirect_to product_path(params[:product_id])
    end
  end



  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end



end
