class ProductsController < ApplicationController
  # before_action :set_product, only: [:show]
  
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.order(created_at: :desc)
    @review = Review.new
  end

  def new
    @product = Product.new
  end


  private 
    
    def set_product
      @product = Product.find params[:id]
    end

end
