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
  @topic_id = params[:id]
  local_topic = Topic.find(@topic_id)
  
  @title = local_topic.title
  @description = local_topic.description 

  @comments = Comment.where('topic_id = ?',@topic_id)
  erb :topics
end

post '/topic' do
  Comment.create(params)
  id = params[:topic_id]
  path = '/topic/' + id.to_s
  redirect path
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
