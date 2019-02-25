class ReviewsController < ApplicationController
 
  def create
    puts "=============PARAMS============="
    puts current_user.inspect
    product = Product.find(params[:product_id])
    review = Review.new(review_params)
    review.product = product
    review.user = current_user

    if review.save
      redirect_to product_path(params[:product_id]), notice: "Review Posted"
    else 
      redirect_to product_path(params[:product_id]), notice: review.errors.full_messages
   end
  end

  def destroy
    review = Review.find(params[:id])

    if review.destroy
      redirect_to product_path(params[:product_id]), notice: "Review deleted"
    else
      redirect_to product_path(params[:product_id]), notice: "Could not delete the comment"
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





