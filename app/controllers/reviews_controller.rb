class ReviewsController < ApplicationController

	def create
		@review = Review.new(params[:review].permit(:restaurant_id, :comment, :rating))
        @review.save
		redirect_to @review.restaurant
	
		# if @restaurant.save
		# 	redirect_to@restaurant
		# else
		#   flash.now[:error] = @restaurant.errors.full_messages.inspect
		#   render action: "new"
		# end
	end	
end
