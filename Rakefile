require 'rake'
require 'date'
require 'sinatra/activerecord/rake'

require_relative 'config/main'

# desc "create the database"
# task "db:create" do
#   puts "Creating file #{DB_PATH} if it doesn't exist..."
#   touch DB_PATH
# end

# task "wtf" do
#   puts ENV['DATABASE_URL']
# end

# desc "drop the database"
# task "db:drop" do
#   puts "Deleting #{DB_PATH}..."
#   rm_f DB_PATH
# end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/application"
end
