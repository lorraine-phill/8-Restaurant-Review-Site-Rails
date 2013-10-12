class Review < ActiveRecord::Base

	  belongs_to :restaurant

	  validates :comment, presence: true
	  validates :rating, presence: true


end
