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
  topic_id = params[:id]
  local_topic = Topic.find(topic_id)
  
  @title = local_topic.title
  @description = local_topic.description 

  # @comments = Comment.all
  # @title = 'All Comments'
  erb :topics
end

post '/topic/:id' do
  comment = Comment.create(params)
  redirect '/topics'
end

get '/*' do 
  "404"
end
