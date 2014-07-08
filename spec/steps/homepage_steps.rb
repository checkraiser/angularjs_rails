

step "there is a todo item with action :action" do |action|
	Item.create(action: action, done: false)
end

step "I visit it" do
	visit '/'
end

step "it should show todo item with action :action" do  |action|
	expect(page).to have_content action
end
