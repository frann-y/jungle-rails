class ProductsController < ApplicationController
  
  #get products
  def index
    @products = Product.all.order(created_at: :desc)
  end

  #get products by id
  def show
    @product = Product.find params[:id]
    @review = Review.new
    @review.user = current_user
    @review.save
    @reviews = @product.reviews.order(created_at: :desc)
  end

end
