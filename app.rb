require "pry"
require "sinatra"
require "sinatra/reloader"

#SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/member.rb"

# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/members.rb"
