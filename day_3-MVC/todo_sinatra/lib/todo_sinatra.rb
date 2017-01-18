require 'pry'

class TodoList
  attr_reader :tasks
  def initialize(user)
    @user = user
    @tasks = []
  end

  def add_task(task)
    @tasks.push(task)
  end

  def delete_task(id_delete)
    @tasks = @tasks.select do |task|
      task.id != id_delete
    end
  end

  def find_task_by_id(id_find)
    @tasks.find {|task| task.id == id_find}
  end

  def sort_by_created(order="ASC")
    if order == "ASC"
      @tasks.sort { | task1, task2 | task1.id <=> task2.id }
    elsif order == "DESC"
      @tasks.sort { | task1, task2 | task2.id <=> task1.id }
    end
  end
end

class Task
  attr_reader :content, :id, :updated_at
  @@current_id = 1
  def initialize(content)
    @content = content.to_s
    @id = @@current_id
    @@current_id += 1
    @completed = false
    @created_at = Time.now
    @updated_at ||= nil
  end

  def completed?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end

  def update_content(new_content)
    @content = new_content.to_s
    @updated_at = Time.now
  end
end
