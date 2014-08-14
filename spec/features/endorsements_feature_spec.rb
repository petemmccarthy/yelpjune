require 'rails_helper'

describe 'endorsing reviews' do

# before u start u need to set up a restaurant and a review
  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, comments: 'OK')
  end

  it "can endorse reviews, updating the review's endorsement count", js: true do
    visit '/restaurants'
    click_link 'Endorse this review'
    expect(page).to have_content '1 endorsement'
  end
end