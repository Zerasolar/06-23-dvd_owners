#Need to run pry to test the driver and sinatra to connect it for the web.
require "pry"
require "sinatra"
require "sinatra/reloader"
#Empowering it with SQLite
require "sqlite3"

DATABASE ||= SQLite3::Database.new("rightstuf.db")

DATABASE.execute("CREATE TABLE IF NOT EXISTS members (id INTEGER PRIMARY KEY, name STRING, username STRING);")
 
DATABASE.results_as_hash = true

#________________________________________________________________________________#

require_relative "member.rb"


################################BEGIN WEB UX######################################

get "/home" do
  erb :"mainmenu"
end

get "/add_member" do
  erb :"/add_member_form"
end

get "/list_members" do
  erb :"/list_members"
end

get "/save_member" do
  @new_member = Member.add({"name" => params["name"], "username" => params["username"]})
  
  erb :"/member_added"
end