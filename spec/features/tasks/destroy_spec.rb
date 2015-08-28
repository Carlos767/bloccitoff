require 'spec_helper'

describe "Deleting todo lists" do
	let!(:task) { Task.create(title: "Groceries", description: "Shopping list.") }

	it "is successful when clicking the destroy link." do
		visit "/tasks"

		within "#task_#{taks.id}" do
			click_link "Destroy"
		end
		expect(page).to_not have_content(task.title)
		expect(Task.count).to eq(0)
	end

end
