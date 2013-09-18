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
    last_response.status.should == 200
  end
  it "should have title 'Topics'" do
    get '/'
    last_response.body.should include('Topics')
  end
end

