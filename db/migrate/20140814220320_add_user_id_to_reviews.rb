class AddUserIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :User, index: true
  end
end
