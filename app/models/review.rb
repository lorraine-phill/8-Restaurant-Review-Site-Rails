class Review < ActiveRecord::Base

	  belongs_to :restaurant

	  validates :comment, presence: true
	  validates :rating, presence: true

	  RATINGS = {1 => "Inedible", 2 => "Poor", 3 => "Average", 4 => "Good", 5 => "Delicious"}

	  def text_rating
	  	"#{rating}- #{RATINGS[rating]}"
	  end

end
