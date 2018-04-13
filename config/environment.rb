ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require_all './app'
configure :development do
  set :database, 'sqlite3:db/misters.db'
end
