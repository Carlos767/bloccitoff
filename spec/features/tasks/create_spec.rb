require 'spec_helper'

describe "Creating todo lists" do 
	def create_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list."

		visit "/tasks"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Todo list"
	end



	it "redirects to the todo list index page on success" do
		create_todo_list
		expect(page).to have_content("My todo list")
	end
	
	it "displays an error when the todo list has no title" do
		expect(Task.count).to eq(0)

		create_task title: ""

		
		expect(page).to have_content("error")
		expect(Task.count).to eq(0)

		visit "/tasks"
		expect(page).to_not have_content("This is what I need to do today.")
	end

	it "displays an error when the todo list has has a title less than 3 characters" do
		expect(Task.count).to eq(0)
		
		create_task title: "Hi"

		expect(page).to have_content("error")
		expect(Task.count).to eq(0)

		visit "/tasks"
		expect(page).to_not have_content("This is what I need to do today.")
	end

	it "displays an error when the todo list has has no description" do
		expect(Task.count).to eq(0)
		
		create_todo_list title: "Shopping list", description: ""

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/tasks"
		expect(page).to_not have_content("Shopping list")
	end

	it "displays an error when the todo list has has no description" do
		expect(TodoList.count).to eq(0)
		
		create_todo_list title: "Shopping list", description: "kiwi"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Shopping list")
	end

end