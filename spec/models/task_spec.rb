require 'spec_helper'

describe Task do
  it { should have_many(:task_items) }

  describe "#has_complete_items?" do
  	let(:todo_list) { Task.create(title: "Groceries", description: "Shopping list") }

  	it "returns true with completed todo list items" do
  		task.task_items.create(content: "Bacon", completed_at: 1.minute.ago)
  		expect(task.has_completed_items?).to be_true
  	end

  	it "returns false with no completed todo list items" do
  		task.task_items.create(content: "Bacon")
  		expect(task.has_completed_items?).to be_false
  	end
  end

  describe "#has_incomplete_items?" do
  	let(:todo_list) { Task.create(title: "Groceries", description: "Shopping list") }

  	it "returns true with incompleted todo list items" do
  		task.task_items.create(content: "Bacon", completed_at: 1.minute.ago)
  		expect(task.has_incompleted_items?).to be_true
  	end

  	it "returns false with no incompleted todo list items" do
  		task.task_items.create(content: "Bacon")
  		expect(task.has_incompleted_items?).to be_false
  	end
  end
end
