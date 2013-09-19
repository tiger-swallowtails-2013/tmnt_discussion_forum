$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'config/main'
require 'models/topic'

enable :sessions



get '/' do
  @topics = Topic.all 
  @title = 'Topics'
  erb :index
end

post '/' do
  Topic.create!(params)
  redirect '/'
end

get '/topics' do
  @comments = Comment.all
  @title = 'All Comments'
  erb :topics
end

post '/topics' do
  comment = Comment.create(params)
  redirect '/topics'
end

get '/signup' do
  @signup = 'Sign-up'
  @users = User.all
  erb :signup
end

post '/signup' do
  User.create!(params)
  redirect '/signup'
end

get '/login' do
  erb :login
end

get '/login' do
  session[:user] ||= "not registered"
  "The cookie you've created contains the value: #{session[:user]}"
end

## working on session validations from logging in

# post '/login' do
#   user = User.find_by username: params[:username].to_s
#   if user.password == params[:password]
#     start session
#   else
#     "wrong password or usename"
#   end
#   session[:user] = params[:name]
#   redirect '/'
# end


get '/*' do 
  "404"
end
