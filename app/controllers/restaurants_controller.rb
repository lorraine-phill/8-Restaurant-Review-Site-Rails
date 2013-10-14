class RestaurantsController < ApplicationController

	def index
    	@restaurants = Restaurant.all
  	end

  	def show
		@restaurant = Restaurant.find(params[:id])
		@review = Review.new(:restaurant => @restaurant)
	end

	def new
		@restaurant = Restaurant.new
		@review = Review.new(:restaurant => @restaurant)
		# @review = @restaurant.reviews.build
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant].permit(:name, :description))
		if @restaurant.save
			redirect_to '/restaurants'
		else
		  flash.now[:error] = @restaurant.errors.full_messages.inspect
		  render action: "new"
		end
	end	

end
