require '../app/controllers/index.rb'

require 'rspec'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe '/' do 
  include Rack::Test::Methods
  it "should exist on server" do
    get '/'
    last_response.status.should == 404
  end
  it "should have title 'Topics'"
  it 
end

