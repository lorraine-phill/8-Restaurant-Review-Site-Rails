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

		describe 'an individual restaurant' do
			it 'has its own page' do
				visit '/restaurants'
				click_link 'Some restaurant'
				expect(current_path).to eq '/restaurants/1'
				expect(page).to have_css 'h1', text: 'Some restaurant'
			end
		end	

		describe 'new restaurant form' do
		    it 'creates a new restaurant' do
		      visit '/restaurants/new'

			      within '.new_restaurant' do
			        fill_in 'Name', with: 'New restaurant'
			        fill_in 'Description', with: 'Great!'
			        click_button "Create Restaurant"
			      end

		      expect(current_url).to eq url_for(Restaurant.last)
		      expect(page).to have_content 'New restaurant'
		      expect(page).to have_content 'Great!'
		    end
		  end


	end