FactoryGirl.define do
	factory :restaurant do
  	name 'KFC'

  	factory(:McDonalds) { name 'McDonalds' }
	end
end