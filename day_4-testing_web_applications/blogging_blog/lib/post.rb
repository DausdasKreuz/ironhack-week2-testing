require 'date'
class Post
  attr_reader :title, :text, :date
  @@current_id = 1
  def initialize ( title, text )
    @title = title
    @text = text
    @date = Time.now
    @@id = @@current_id
    @@current_id += 1
  end

  def update_title( new_title )
    @title = new_title
  end

  def update_text( new_text )
    @text = new_text
  end

  def update_date
    @date = Date.new
  end
end
