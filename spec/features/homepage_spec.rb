require 'spec_helper'

feature 'Homepage' do 
	scenario 'viewing homepage', :js => true do 
		visit '/'
		click_link 'Show Orders'
		expect(page).to have_content 'Show Orders'
	end

	scenario 'viewing products', :js => true do 
		c = Category.create(name: 'Category1')
		Product.create(name: 'Product1', category: c)
		visit '/'
		click_link 'Products'
		expect(page).to have_content 'Product1'
		expect(page).to have_content 'Category1'
	end
end