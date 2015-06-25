require "pry"
require "sinatra"
require "sinatra/reloader"

#SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/member.rb"
require_relative "models/anime_series.rb"
require_relative "models/format_type.rb"
require_relative "models/media.rb"

# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/members.rb"
require_relative "controllers/anime_seriess.rb"
require_relative "controllers/format_types.rb"
require_relative "controllers/medias.rb"
