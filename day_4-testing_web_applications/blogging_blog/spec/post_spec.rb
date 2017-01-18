require File.expand_path '../spec_helper.rb', __FILE__
require 'date'
require 'pry'

RSpec.describe 'Post' do
  let( :post ) { Post.new( "1st post", "This is the first post") }

  describe '.update_title' do
    before { post.update_title( 'new title' ) }

    it 'puts the new title in the post' do
      expect( post.title ).to eq( 'new title' )
    end

    it 'do not change other attributes' do
      expect( post.text ).to eq( post.text )
      expect( post.date ).to eq( post.date )
    end
  end

  describe '.update_text' do
    before { post.update_text( 'new text' ) }

    it 'puts the new text in the post' do
      expect( post.text ).to eq( 'new text' )
    end

    it 'do not change other attributes' do
      expect( post.title ).to eq( post.title )
      expect( post.date ).to eq( post.date )
    end
  end

  describe '.update_date' do
    before { post.update_date }

    it 'puts the new date in the post' do
      expect( post.date ).to eq( Date.new )
    end

    it 'do not change other attributes' do
      expect( post.title ).to eq( post.title )
      expect( post.text ).to eq( post.text )
    end
  end
end
