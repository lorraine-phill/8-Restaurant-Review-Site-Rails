require 'spec_helper'

	def create_restaurant(some_name)
		Restaurant.create(:name => some_name)
	end

	describe 'the restaurant section' do

		before(:all) do
	    	create_restaurant 'Some restaurant'
	  	end

			describe '/restaurants' do
				it 'should display a list of restaurants' do
					visit '/restaurants'
					expect(page).to have_content 'Some restaurant'	
				end	
			end


	end