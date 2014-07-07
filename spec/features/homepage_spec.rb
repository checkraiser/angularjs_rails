require 'spec_helper'

feature 'Homepage' do 
	scenario 'viewing homepage', :js => true do 
		visit '/'
		click_link 'Show Orders'
		expect(page).to have_content 'Show Orders'
	end
end