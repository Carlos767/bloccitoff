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

	it "displays an error with no content" do
		visit_task(task)
		click_link "New Todo Item"
		fill_in "Content", with: ""
		click_button "Save"
		within("div.flash") do
			expect(page).to have_content("There was a problem adding that todo list item.")
		end
		expect(page).to have_content("Content can't be blank")
	end

	it "displays an error with no content less than 2 characters long" do
		visit_task(task)
		click_link "New Todo Item"
		fill_in "Content", with: ""
		click_button "Save"
		within("div.flash") do
			expect(page).to have_content("There was a problem adding that todo list item.")
end