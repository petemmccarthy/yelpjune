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

    peter = User.create(email: 'peter@example.com', password: "12345678", password_confirmation:'12345678')
    login_as talal
    leave_review('Great', 5)

    expect(page).to have_content 'Average rating: ★★★★☆'
  end

  it 'does not allower users to write duplicate reviews' do
    leave_review('So so', 3)
    expect(page).not_to have_link 'Review KFC'
  end
  
end