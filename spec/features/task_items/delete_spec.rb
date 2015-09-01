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

	it "is successful" do
		visit_task(task)
		within "#task_item_#{task_item_id}" do
			click_link "Delete"
		end
		expect(page).to have_content("Todo list item was deleted.")
		expect(TaskItem.count).to eq(0)
	end


end