require 'sinatra'
require_relative '../models/message.rb'


get '/' do
  erb :homepage
end


post '/' do
  info = {title: params[:posttitle], content: params[:postcontent]} 
  Message.create(info)
  @first_message_content = Message.last.content
  erb :homepage
end




# Message.create!({content: "some content",title: "some title"})