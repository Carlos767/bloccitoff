require 'spec_helper'

describe "Editing task items" do
	let!(:task) { Task.create(title: "Grocery list", description "Groceries") }
	let!(:task) { task.task_items.create(content: "Bacon") }

	it "is successful when marking a single item complete" do
		expect(task_item.completed_at).to be_nil
		visit_task task
		within dom_id_for(task_item) do
			click_link "Mark Complete"
		end
		task_item.reload
		expect(task_item.completed_at).to_not be_nil
	end
end
