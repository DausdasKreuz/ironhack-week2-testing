require 'haml'
require 'pry'
require 'sinatra'
require "sinatra/reloader" if development?
require 'imdb'
require_relative 'lib/queryToIMDB.rb'
require_relative 'lib/movie.rb'

set :haml, format: :html5
enable(:sessions)

get '/' do
  erb( :index )
end

post '/make_search' do
  query = QueryToIMDB.new
  query.do_query_to_IMDB(params[:key_request])
  session[:movies] = query.movies
  redirect to "/show_films"
end

get '/show_films' do
  erb( :films )
end
