require 'spec_helper'

describe "Editing task items" do
	let!(:task) { Task.create(title: "Grocery list", description "Groceries") }
	let!(:task) { task.task_items.create(content: "Bacon") }

	def visit_task(list)
		visit "/tasks"
		within "#task_#{list.id}" do
			click_link "List Items"
		end
	end

	it "is successful with valid content" do
		visit_task(task)
		within("#task_items_#{todo_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with "Lots of Bacon"
		click_button "Save"
		expect(page).to have_content to eq("Lots of Bacon")
		task_item.reload
		expect(task_item.content).to eq("Lots of Bacon")
	end
	it "is unsuccessful with valid content" do
		visit_task(task)
		within("#task_items_#{todo_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with ""
		click_button "Save"
		expect(page).to_not have_content("Saved todo list item.")
		expect(page).to have_content("Content can't be blank")
		task_item.reload
		expect(task_item.content).to eq("Bacon")
	end

	it "is unsuccessful with not enough content" do
		visit_task(task)
		within("#task_items_#{todo_item.id}") do
			click_link "Edit"
		end
		fill_in "Content", with "1"
		click_button "Save"
		expect(page).to_not have_content("Saved todo list item.")
		expect(page).to have_content("Content is too short")
		task_item.reload
		expect(task_item.content).to eq("Bacon")
	end

end