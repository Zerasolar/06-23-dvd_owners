# Load/create the database for the dvd_owners project.
DATABASE = SQLite3::Database.new("rightstuf.db")
# Making the tables
DATABASE.execute("CREATE TABLE IF NOT EXISTS members (id INTEGER PRIMARY KEY, name STRING, username STRING);")
 
# Get results as an Array of Hashes.
DATABASE.results_as_hash = true
