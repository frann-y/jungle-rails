class ReviewsController < ApplicationController

    #before_action = before_filter
    before_action :logged_in

    def create

        product = Product.find(params[:product_id])
        review = Review.new(review_params)
        review.user = current_user
        review.user.save
        review.product = product

        if review.save
            review.save
            redirect_to product_path(params[:product_id]), notice: "Review created"
        else
            redirect_to product_path(params[:product_id]), notice: "Error: Could not submit form."
        end
    end
    
    def destroy
        review = Review.find(params[:id])
        review.destroy
        if review.destroy
          redirect_to product_path(params[:product_id]), notice: "Review deleted!"
        else
          redirect_to product_path(params[:product_id]), notice: "Could not delete the review!"
        end
    end

    private

        def logged_in
            unless current_user
                flash[:error] = "Log in!!!"
                redirect_to "/login"
            end
        end

        def review_params
        params.require(:review).permit(:description, :rating)
    end

end
