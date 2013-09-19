$LOAD_PATH.unshift(File.expand_path("./app"))
$LOAD_PATH.unshift(File.expand_path("."))

require 'config/main'
require 'models/topic'


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


get '/*' do 
  "404"
end
