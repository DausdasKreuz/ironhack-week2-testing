class Blog
  attr_reader :posts
  def initialize
    @posts = []
  end

  def add_post( post )
    @posts.push(post)
  end

  def delete_post( post )
    @posts.delete(post)
  end

  def show_posts
    @posts
  end

  def latest_posts
    @posts.sort_by { |post| post.date }.reverse
  end
end
