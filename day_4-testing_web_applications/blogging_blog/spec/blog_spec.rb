require File.expand_path '../spec_helper.rb', __FILE__
require 'date'
require 'pry'

RSpec.describe 'Blog' do
  before( :all ) do
    @blog = Blog.new
    4.times{ |i| @blog.posts.push( Post.new( "#{i}", "This is the #{i} post") ) }
  end
  let( :post ) { Post.new( "1st post", "This is the first post") }

  describe '.add_post' do
    before { @blog.add_post( post ) }

    it 'puts the post on the blog' do
      expect( @blog.posts ).to include post
    end
  end

  describe '.delete_post' do
    before { @blog.delete_post( post ) }

    it 'puts the post on the blog' do
      expect( @blog.posts.include?( post ) ).to be_falsy
    end
  end

  describe '.show_posts' do
    it 'output an array with the posts' do
      expect( @blog.show_posts ).to eq( @blog.posts )
    end
  end

  describe '.latest_posts' do
    it 'sort the posts in descendant chronological order' do
      blog = Blog.new
      earlier_post = Post.new("0", "c")
      sleep 10
      latest_post = Post.new("1", "c")
      blog.posts.push(latest_post)
      blog.posts.push(earlier_post)
      sorted_posts = blog.latest_posts
      expect( sorted_posts[0].date).to be > sorted_posts[1].date
    end
  end
end
