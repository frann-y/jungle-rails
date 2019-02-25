class ReviewsController < ApplicationController

    #before_action = before_filter
    before_filter :set_review, only: [:show, :edit, :update, :destroy]


    def index
        @reviews = Review.all.order(created_at: :desc)
    end

    def create

        @product = Product.find(params[:product_id])
        @review = Review.new(review_params)
        @review.user = current_user
        @review.save

        if @review.save
            redirect_to product_path(params[:product_id]), notice: "Review created"
        else
            redirect_to "/", notice: "Error: Could not submit form."
        end
    end

    private

        def review_params
        params.require(:review).permit(:rating, :description)
    end

end
