require_relative '../../config/main'
require_relative '../models/topic'


get '/' do
  @topic = Topic.all 
  @title = 'Topics'
  erb :index
end

post '/' do
  topic = Topic.create(params)
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

get '/*' do 
  "404"
end
