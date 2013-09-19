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
  User.create!(params)
  redirect '/signup'
end


get '/*' do 
  "404"
end
