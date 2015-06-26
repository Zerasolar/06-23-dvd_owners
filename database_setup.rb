# Load/create the database for the dvd_owners project.
DATABASE = SQLite3::Database.new("media_members.db")
# Making the tables
DATABASE.execute("CREATE TABLE IF NOT EXISTS members (id INTEGER PRIMARY KEY, name STRING, username STRING);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS anime_series ( id INTEGER PRIMARY KEY, title STRING);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS format_types (id INTEGER PRIMARY KEY, name STRING);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS media (id INTEGER PRIMARY KEY, format_type_id INTEGER, anime_series INTEGER, name STRING);")
 
# Get results as an Array of Hashes.
DATABASE.results_as_hash = true
