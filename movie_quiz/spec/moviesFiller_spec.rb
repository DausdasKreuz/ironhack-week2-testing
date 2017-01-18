require File.expand_path '../spec_helper.rb', __FILE__
require 'spec_helper'

RSpec.describe 'movieFiller' do

  describe '.fill_movie' do
    it 'movies has only movies with poster' do
      query = Imdb::Search.new('star wars').movies
      fails =[]
      unless MoviesFiller.fill_movie(query) 

      end
      expect().to be_falsy
    end
  end
end
