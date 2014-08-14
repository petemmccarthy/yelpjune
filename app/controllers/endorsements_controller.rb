class EndorsementsController < ApplicationController

	def create
   	@review = Review.find(params[:review_id])
   	@review.endorsements.create

   	# JSON is the format u communicate btwn ruby and javascript
   	render json: { new_endorsement_count:  @review.endorsements.count }
  end
end
