class ReviewsController < ApplicationController

	def create
		@review = Review.new(params[:review].permit(:restaurant_id, :comment, :rating))
        if @review.save
			redirect_to @review.restaurant
		else
			flash[:error] = @review.errors.full_messages
			redirect_to "/restaurants/#{@review.restaurant.id}"
		end
	
		# if @restaurant.save
		# 	redirect_to@restaurant
		# else
		#   flash.now[:error] = @restaurant.errors.full_messages.inspect
		#   render action: "new"
		# end
	end	
end
