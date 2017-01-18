require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'lib/Calculator.rb'

get '/' do
  erb(:calculate)
end

post "/calculate" do

  first_number = params[:first_number]
  second_number = params[:second_number]
  case params[:operation]
  when "addition"
    result = Calculator.calculate_add(first_number, second_number)
    "The addition of #{first_number} to #{second_number} is #{result}"
  when "substraction"
    result = Calculator.calculate_substract(first_number, second_number)
    "The  substraction of #{second_number} to #{first_number} is #{result}"
  end

end
