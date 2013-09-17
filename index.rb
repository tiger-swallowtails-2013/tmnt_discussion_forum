require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/index.db")

class Comment
  include DataMapper::Resource
  property :id, Serial
  property :content, Text, :required => true
  property :complete, Boolean, :required => true, :default => false
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!

get '/' do
  @comments = Comment.all :order => :id.desc
  @title = 'All Comments'
  erb :index
end

post '/' do
  comment = Comment.new
  comment.content = params[:content]
  comment.created_at = Time.now
  comment.updated_at = Time.now
  comment.save
  redirect '/'
end

