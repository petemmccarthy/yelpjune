FactoryGirl.define do
  factory :user do
    email 'peter@example.com'
    password '12345678'
    password_confirmation '12345678'
# this works in the same way as inheritance so to create a 2nd user...
	  factory :alex do
	  	email 'alex@example.com'
  	end
	end
end