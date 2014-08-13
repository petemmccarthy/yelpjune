def leave_review(comments, rating)
  visit restaurants_path
  click_link 'Review KFC'
  fill_in 'Comments', with: comments
  select rating.to_s, from: 'Rating'
  click_button 'Leave review'
end