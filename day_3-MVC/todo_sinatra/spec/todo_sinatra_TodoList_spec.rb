require 'pry'
require_relative '../lib/todo_sinatra.rb'

describe TodoList do

  before :each do
    @todo_list = TodoList.new("dani")
    @task1 = Task.new("content1")
    @task2 = Task.new("content2")
    @task3 = Task.new("content3")
  end

  describe ".add_task" do
    it "verify the task is added" do
      @todo_list.add_task(@task1)
      expect(@todo_list.tasks[0].content).to eq("content1")
    end
  end

  describe ".delete_task" do
    it "delete a task using id" do
      @todo_list.add_task(@task1)
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task3)
      @todo_list.delete_task(@task1.id)
      expect(@todo_list.tasks[0].content).not_to eq("content1")
    end
  end

  describe ".find_task_by_id" do
    it "find a task using its id" do
      @todo_list.add_task(@task1)
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task3)
      expect(@todo_list.find_task_by_id(@task1.id)).to eq(@task1)
    end
    it "if not find a task and give nil" do
      @todo_list.add_task(@task1)
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task3)
      expect(@todo_list.find_task_by_id(@task1.id)).to eq(@task1)
    end
  end

  describe ".sort_by_created" do
    it "sort tasks by its date ascending by default" do
      @todo_list.add_task(@task1)
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task3)
      expect(@todo_list.sort_by_created).to eq([@task1, @task2, @task3])
    end
    it "sort tasks by its date ascending" do
      @todo_list.add_task(@task1)
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task3)
      expect(@todo_list.sort_by_created("ASC")).to eq([@task1, @task2, @task3])
    end
    it "sort tasks by its date descending" do
      @todo_list.add_task(@task1)
      @todo_list.add_task(@task2)
      @todo_list.add_task(@task3)
      expect(@todo_list.sort_by_created("DESC")).to eq([@task3, @task2, @task1])
    end
  end
end
