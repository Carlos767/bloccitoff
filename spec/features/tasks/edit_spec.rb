require 'spec_helper'

describe "Editing todo lists" do
	let!(:task) { Task.create(title: "Groceries", description: "Shopping list.") }
	def update_task(options={})
		options [:title] ||= "My todo list"
		options[:description] ||= "This is my todo list."

		task = options[:task]

		visit"/tasks"
		within "#task_#{task.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:desription]
		click_button "Update Todo list"
	end

	it "updates a todo list successfully with correct information" do
		update_task task: task, 
					title: "New title", 
					description: "New description"

		
		task.reload

		expect(page).to have_content("Todo list was successfully updated")
		expect(task.title).to eq("New title")
		expect(task.description).to eq("New description")
	end

	it "displays an error with no title" do
		update_task task: task, title: ""
		title = task.title
		title.reload
		expect(task.title).to eq(title)
		expect(page).to have_content("error")
	end

	it "displays an error with too short a title" do
		update_task task: task, title: "Oh"
		expect(page).to have_content("error")
	end

	it "displays an error with no desctiption" do
		update_task task: task, description: ""
		expect(page).to have_content("error")
	end

	it "displays an error with too short a description" do
		update_task task: task, description: "Oh"
		expect(page).to have_content("error")
	end
end