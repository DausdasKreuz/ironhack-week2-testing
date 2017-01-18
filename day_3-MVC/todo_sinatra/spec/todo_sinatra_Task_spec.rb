require_relative '../lib/todo_sinatra.rb'

describe Task do

  before :each do
    @task = Task.new("content")
  end

  describe ".completed?" do
    it "tell incompleted task status" do
      expect(@task.completed?).to eq(false)
    end
    it "tell completed task status" do
      @task.complete!
      expect(@task.completed?).to eq(true)
    end
  end

  describe ".complete!" do
    it "change incompleted task status" do
      @task.complete!
      expect(@task.completed?).to eq(true)
    end
  end

  describe ".make_incomplete!" do
    it "change completed task status" do
      @task.complete!
      @task.make_incomplete!
      expect(@task.completed?).to eq(false)
    end
  end

  describe ".update_content!" do
    it "change a task test" do
      @task.update_content("new content")
      expect(@task.content).to eq("new content")
    end
    it "update updated_at attribute" do
      @task.update_content("new content")
      expect(@task.updated_at > Time.now-1).to be_truthy
    end
  end

end
