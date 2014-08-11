class RestaurantsController < ApplicationController

# these are also called actions
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end
	
	# def create
	# 	Restaurant.create(params[:restaurant].permit(:name))
	# 	redirect_to '/restaurants'
	# end

	# def edit
	# 	@restaurant = Restaurant.find(params[:id]
	# end

	# def edit
	# 	@restaurant = Restaurant.find(params[:id]
	# 	@restaurant.update(params[:restaurant].permit(:name))
	# end

	# def destroy
	# 	@restaurants = Restaurant.find(params[:id]
	# 	restaurant.destroy

	# 	flash[:notice] 'Restaurant deleted successfully'
	# 	redirect_to '/restaurants'
	# end

end
