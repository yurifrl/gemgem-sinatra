require "sinatra/sequel"
require "sqlite3"

configure :development do
  set :database, "sqlite://tmp/development.sqlite"
end

configure :test do
  set :database, "sqlite3::memory:"
end

require_relative "migrations"

Sequel::Model.strict_param_setting = false
# Dir["models/**/*.rb"].each{|model|
#   require model
# }