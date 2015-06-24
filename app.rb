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

get "/edited_member/:x" do
  @member_instance = Member.find(params["x"])
  if @member_instance.name_valid?(params["name"])
    @member_instance.save
    erb :"members/member_changed"
  else
    @error = true
    erb :"members/member"
  end
end

get "/delete_member" do
  erb :"members/delete_member"
end

get "/gone_member" do
  params["member"].each do |member|
    Member.delete_row(member)
  end
  erb :"members/member_deleted"
end
    