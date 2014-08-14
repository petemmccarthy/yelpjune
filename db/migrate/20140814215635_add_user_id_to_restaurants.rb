class AddUserIdToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :User, index: true
  end
end
