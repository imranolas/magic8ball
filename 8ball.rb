require 'sinatra'
require 'sinatra/json'
require './question'

get '/' do
	erb :index
end

post '/' do
	ask = Question.new(params[:ask])
	json :ask => ask.question_empty, :answer => ask.answer_text, :name => ask.answer_class 
end