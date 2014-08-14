class RestaurantsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
# these methods are also called actions
	def index
		@restaurants = Restaurant.all
	end

# this method doesnt actually do anything (kinda)
# create does the creating
	def new
		@restaurant = Restaurant.new
	end
	
	def create
		@restaurant = Restaurant.new(params[:restaurant].permit(:name))

		if @restaurant.save
			redirect_to '/restaurants'
		else
      		render 'new'
    	end
	end

	def edit
		@restaurant = current_user.restaurants.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
   	flash[:notice] = 'This is not your restaurant!'
   	redirect_to '/restaurants'
	end

	def update
		@restaurant = current_user.restaurants.find(params[:id])
    	@restaurant.update(params[:restaurant].permit(:name))

    	redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		flash[:notice] = 'Restaurant deleted successfully'
		redirect_to '/restaurants'
	end

end
