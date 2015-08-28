require 'spec_helper'

describe "Viewing task items" do
	let!(:task) { Task.create(title: "Grocery list", description "Groceries") }
	it "displays no items when a todo list s empty" do
		visit "/tasks"
		within "#task_#{task.id}" do
			click_link "List Items"
		end
		expect(page).to have_content("TaskItems#index")
	end
	
end