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

	context "with completed items" do
		let!(complete_task_item) {task.task.items.create(content: "Bacon", completed:)}

		it "shows completed items as completed" do
			visit_task task
			within dom_id_for(completed_task_item) do
				expect(page).to have_content(completed_task_item.completed_at)
			end
		end

		it "shows does not give the option to mark complete" do
			visit_task task
			within dom_id_for(completed_task_item) do
				expect(page).to_not have_content("Mark Complete")
			end
		end
	end
end
