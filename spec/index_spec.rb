$LOAD_PATH.unshift(File.expand_path("./app"))

require 'controllers/index.rb'

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

describe 'add new topic' do
  include Rack::Test::Methods
  it "should have a title form" do
    get '/'
    last_response.body.should include("name=\"title\"")
  end

  it "should have a description form"

  it "should have a tags form"

  it "should create a new topic with title" do
    post '/', {:title => "some title", :description => "some description" }
    Topic.last.title.should eql "some title"
  end
end

describe 'homepage' do
  include Rack::Test::Methods

  it "should list last submitted topic on homepage" do
    post '/', {:title => "some title", :description => "some description" }
    get '/'
    last_response.body.should include("some description")
  end

  it "should have each thread link to a seperate page" do
    get '/'
    Topic.all.each do |topic|
      last_response.body.should include("/topic/#{topic.id}")
    end
  end

end
