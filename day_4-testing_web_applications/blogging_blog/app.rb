require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/blog.rb'
require_relative 'lib/post.rb'

set :haml, format: :html5
enable(:sessions)

blog = Blog.new
blog.add_post(Post.new( "1st post", "This is the first post"))
blog.add_post(Post.new( "2nd post", "This is the second post"))
blog.add_post(Post.new( "3rd post", "This is the third post"))
blog.add_post(Post.new( "4th post", "This is the fourth post"))

get"/" do
  erb(:index)
end
