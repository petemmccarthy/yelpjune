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
	end
end

describe 'creating restaurants' do

	context 'when adding a restaurant' do

    	it 'prompts the user to fill out a form, then displays the new restaurant' do
      	visit '/restaurants'
      	click_link 'Add restaurant'

      	fill_in 'Name', with: 'KFC'
      	# fill_in 'Cuisine', with: 'chicken'
      	click_button 'Submit'

      	expect(page).to have_content 'KFC'
      	# expect(page).to have_content 'chicken'
      	expect(current_path).to eq '/restaurants'
    	end
   end

   context 'adding valid restaurants' do

    it 'prompts the user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add restaurant'

      fill_in 'Name', with: 'KFC'
      click_button 'Submit'

      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end

    it 'shows an error because of an uncapitalised name that is too short' do
      visit '/restaurants'
      click_link 'Add restaurant'
      fill_in 'Name', with: 'ab'

      click_button 'Submit'
      expect(page).not_to have_css 'h2', text: 'ab'
      expect(page).to have_content 'errors'
    end


end

	context 'when restaurants have been added' do

    	before(:each) do
      	Restaurant.create(name: 'McDonalds')
    	end

		it 'should display them' do
      	visit '/restaurants'
      	expect(page).to have_content 'McDonalds'
    	end
    end
end



describe 'editing restaurants' do

   before(:each) do
      Restaurant.create(name: 'KFC')
   end

   it 'prompts the user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Edit KFC'

     	fill_in 'Name', with: 'KFC'
      click_button 'Submit'

      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
   end
end

  describe 'deleting restaurants' do
    before(:each) do
      Restaurant.create(name: 'KFC')
    end

    it 'removes restaurants when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'

      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end




