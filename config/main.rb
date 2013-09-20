require 'pathname'
require 'sinatra'
require 'sinatra/activerecord'

require 'date'

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

APP_NAME = APP_ROOT.basename.to_s

DB_PATH  = APP_ROOT.join('db', APP_NAME).to_s

new_migration_filename = Time.new.to_i.to_s + "_create_tablename" + ".rb"

MIGRATION_PATH = APP_ROOT.join('db','migrate',new_migration_filename).to_s

VIEW_PATH = APP_ROOT.join('app','views').to_s

PUBLIC_PATH = APP_ROOT.join('public').to_s

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

set :database, (ENV['DATABASE_URL'] || "postgres://localhost/#{APP_NAME}")


configure do
  set :views, VIEW_PATH
end

configure do 
  set :public_folder, PUBLIC_PATH
end
