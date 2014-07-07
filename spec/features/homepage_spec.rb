require 'spec_helper'

feature 'Homepage' do 
	scenario 'viewing todos', :js => true do 
		Item.create(action: 'item 1', done: false)
		visit '/'		
		expect(page).to have_content 'item 1'
	end
	scenario 'create todo', :js => true do 
		visit '/'
		fill_in 'action', :with => 'My first action'
		click_button 'Add'
		expect(page).to have_content 'My first action'
		Item.count.should == 1
	end
end