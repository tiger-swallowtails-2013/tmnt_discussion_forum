require 'sinatra'

var = 2

get '/' do 
  erb :homepage
end

post '/' do
  @response_word = params[:textfield]
  erb :homepage
end