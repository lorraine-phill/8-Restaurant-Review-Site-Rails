require 'spec_helper'

	def create_restaurant(some_name, some_description)
		Restaurant.create(:name => some_name, :description => some_description)
	end

	describe 'the restaurant section' do

		before(:all) do
	    	create_restaurant 'Some restaurant','Some description'
	  	end

		describe '/restaurants' do
			it 'should display a list of restaurants' do
				visit '/restaurants'
				expect(page).to have_content 'Some restaurant'	
			end	
		end

		describe 'an individual restaurant' do
			it 'has a description and its own page ' do
				visit '/restaurants'
				click_link 'Some restaurant'
				expect(current_path).to eq '/restaurants/1'
				expect(page).to have_css 'h1', text: 'Some restaurant'
				expect(page).to have_css 'h3', text: 'Some description'
			end
		end	

		describe 'new restaurant form' do
		    it 'adds a new restaurant to list' do
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

		describe 'the reviews section' do

			it 'appears on the restaurant page' do
				visit '/restaurants'
				click_link 'Some restaurant'
				find_field('comment').value.should eq 'This is a comment'
			end

		end

	end