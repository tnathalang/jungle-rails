class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => ENV["USERNAME"], :password => ENV["PASSOWRD"]
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def index 
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  end

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end


  private

  def category_params
    params.require(:category).permit(
      :name
    )
      
  end

end
