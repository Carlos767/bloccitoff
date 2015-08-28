require 'spec_helper'

describe "Viewing task items" do
	let!(:task) { Task.create(title: "Grocery list", description "Groceries") }

	def visit_task(list)
		visit "/tasks"
		within "#task_#{list.id}" do
			click_link "List Items"
		end
	end


	it "displays the title of the todo list" do
		visit_task(task)
		within("h1") do
			expect(page).to have_content(task.title)
		end
	end

	it "displays no items when a todo list s empty" do
		visit_task(task)
		expect(page.all("ul.task_items li").size).to eq(0)
	end

	it "displays item content when a todo list has items" do
		task.tasks.create(content: "Butter")
		task.tasks.create(content: "Bacon")
		
		visit_task(task)
		
		expect(page.all("ul.task_items li").size).to eq(2)

		within "ul.task_items" do
			expect(page).to have_content("Butter")
			expect(page).to have_content("Bacon")
		end
	end
	
end