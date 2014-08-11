require 'rails_helper'

describe 'restaurants' do
	context ' no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants available'
			expect(page).to have_link 'Add restaurant'
		end

		it 'can go to add a new restaurant page' do 
			visit '/restaurants'
			click_on "Add restaurant"
			expect(page).to have_content("Enter a new restaurant")
		end

		it 'can add a new restaurant' do
			visit '/restaurants/new'

		end

	end
end