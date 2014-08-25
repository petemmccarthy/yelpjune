require 'rails_helper'

describe 'reviewing restaurants' do
  before do
    restaurant = create(:restaurant)
  end

  it 'allows users to leave reviews using a form, which appear alongside restaurants' do
    leave_review('So so', 3)

    expect(current_path).to eq restaurants_path
    expect(page).to have_content 'So so (★★★☆☆)'
  end

  it 'display the average rating from all reviews' do
    leave_review('So so', 3)

    peter = create(:user)
    login_as peter
    leave_review('Great', 5)

    expect(page).to have_content 'Average rating: ★★★★☆'
  end

  it 'does not allower users to write duplicate reviews' do
    leave_review('So so', 3)
    expect(page).not_to have_link 'Review KFC'
  end
  
end