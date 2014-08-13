require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
 let(:restaurant) { Restaurant.create(name: 'Nandos') }

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns N/A' do
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end

    context '1 review' do
      it 'returns that rating' do
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context 'multiple reviews' do
      it 'return the average of all ratings' do
        restaurant.reviews.create(rating: 3)
        restaurant.reviews.create(rating: 5)

        expect(restaurant.average_rating).to eq 4
      end

      it 'returns a float, if average is a non-whole number' do
        restaurant.reviews.create(rating: 4)
        restaurant.reviews.create(rating: 5)

        expect(restaurant.average_rating).to eq 4.5
      end
    end
  end
end