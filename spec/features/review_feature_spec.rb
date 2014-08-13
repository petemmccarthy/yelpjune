require 'rails_helper'

describe 'reviewing restaurants' do
  before do
    Restaurant.create(name: 'KFC')
  end

  it 'allows users to leave reviews using a form, which appear alongside restaurants' do
    leave_review('So so', 3)

    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'So so (★★★☆☆)'
  end

  it 'display the average rating from all reviews' do
    leave_review('So so', 3)
    leave_review('Great', 5)

    expect(page).to have_content 'Average rating: ★★★★☆'
  end
end