require_relative '../../config/main'
require_relative '../models/topic'


# require 'data_mapper'

# DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/index.db")

# class Comment
#   include DataMapper::Resource
#   property :id, Serial
#   property :title, Text
#   property :content, Text, :required => true
#   property :created_at, DateTime
#   property :updated_at, DateTime
# end

# class Thread
#   include DataMapper::Resource
#   property :id, Serial
#   property :title, Text
#   property :description, Text, :required => true
#   property :created_at, DateTime
#   property :updated_at, DateTime
# end

# # DataMapper.finalize.auto_upgrade!

# helpers do
#   include Rack::Utils
#   alias_method :h, :escape_html
# end

get '/' do
  @topic = Topic.all 
  # :order => :id.desc
  @title = 'Topics'
  erb :index
end

post '/' do
  topic = Topic.create(params)
  topic.title = params[:title]
  topic.description = params[:description]
  redirect '/'
end

get '/topics' do
  @comments = Comment.all
  # :order => :id.desc
  @title = 'All Comments'
  # params[:topic]
  erb :topics
end

post '/topics' do

  comment = Comment.create(params)
  
  # comment.title = params[:title]
  redirect '/topics'
end

get '/*' do 
  "404"
end
