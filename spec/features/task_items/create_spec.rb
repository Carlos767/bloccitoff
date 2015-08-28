require 'spec_helper'

describe "Adding task items" do
	let!(:task) { Task.create(title: "Grocery list", description "Groceries") }

	def visit_task(list)
		visit "/tasks"
		within "#task_#{list.id}" do
			click_link "List Items"
		end
	end

	it "is sussful with valid content" do
		visit_task(task)
		click_link "New Todo Item"
		fill_in "Content", with: "Bacon"
		click_button "Save"
		expect(page).to have_content("Added todo list item.")
		within("ul.task") do
			expect(page).to have_content("Bacon")
		end
	end



end