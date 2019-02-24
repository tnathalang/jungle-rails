class ReviewsController < ApplicationController
 
  def create
    puts "=============PARAMS============="
    puts params
    product = Product.find(params[:product_id])
    review = Review.new(review_params)
    review.product = product

    if review.save
      redirect_to product_path(params[:product_id]), notice: "Review Posted"
    else 
      redirect_to product_path(params[:product_id]), notice: review.errors.full_messages
   end
  end


private

  def review_params
    params.require(:review).permit(
      :description, 
      :rating, 
      :user_id,
      :product_id
      )
  end

end





