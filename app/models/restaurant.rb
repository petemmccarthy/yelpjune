class Restaurant < ActiveRecord::Base

	has_many :reviews, dependent: :destroy
	belongs_to :user

	validates :name, length: { minimum: 3 }, format: { with: /\A[A-Z]/, message: 'has to begin with a capital letter' }, uniqueness: true

	def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  	end

  	def has_been_reviewed_by?(user)
   	reviews.find_by(user: user)
  	end

end
