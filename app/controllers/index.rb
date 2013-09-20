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

get '/topic/:id' do
  @local_topic = Topic.find(params[:id])
  erb :topics
end

post '/topics/:topic_id/comments' do
  Comment.create(topic_id: params[:topic_id],
                 title: params[:title],
                 content: params[:content])
  redirect "/topic/#{params[:topic_id].to_s}"
end

get '/signup' do
  @signup = 'Sign-up'
  @users = User.all
  erb :signup
end

post '/signup' do
  user = User.create!(params)
  session[:user_id] = user.id
  session[:fullname] = "#{user.first_name} #{user.last_name}"
  redirect '/'
end

get '/login' do
  session[:errors] = nil
  erb :login
end

post '/login' do
  user = User.authenticate(username: params[:username], 
                           password: params[:password])
  if user
    session[:user_id] = user.id
    session[:fullname] = "#{user.first_name} #{user.last_name}"
    session[:errors] = nil
    redirect '/'
  elsif User.find_by username: params[:username]
    # User.find_by('username = ?', params[:username])
    session[:errors] = "Invalid password"
    erb :login
  else
    session[:errors] = "Username not recognized"
    erb :login
  end
end

get '/logout' do
  erb :logout
end

post '/logout' do
  session[:user_id] = nil
  session[:fullname] = nil
  redirect '/'
end

get '/*' do 
  "404"
end
