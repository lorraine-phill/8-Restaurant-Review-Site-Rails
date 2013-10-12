require 'spec_helper'

describe Restaurant do
	it {should have_many(:reviews)}

	it "should have an error message if name is missing" do
		r = Restaurant.new
		r.valid?
		expect(r.errors.full_messages).to include "Name can't be blank"
	end

end
