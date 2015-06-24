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
  erb :"members/add_member_form"
end

get "/list_members" do
  erb :"members/list_members"
end

get "/save_member" do
  @new_member = Member.add({"name" => params["name"], "username" => params["username"]})
  
  erb :"members/member_added"
end

get "/change_member" do
  erb :"members/change_member"
end

get "/change_member_form/:x" do
  @member_instance = Member.find(params["x"])
  erb :"members/member"
end

get "/edited_member" do
  binding.pry
  @member_instance = Member.find(params["id"])
  if !params["name"].empty?
    @member_instance.name = params["name"]
  end
  if !params["username"].empty?
    @member_instance.name = params["username"]
  end
  @member_instance.save
  erb :"member_changed"
end