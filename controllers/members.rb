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
# get "/save_member" do
#   m = Member.new(params["username"])
#   if !m.existing_username
#     @new_member = Member.add({"name" => params["name"], "username" => params["username"]})
#     erb :"members/member_added"
#   else
#     @error = true
#     erb :"members/add_member_form"
#   end
# end

get "/change_member" do
  erb :"members/change_member"
end

get "/change_member_form/:x" do
  @member_instance = Member.find(params["x"])
  binding.pry
  erb :"members/member"
end

get "/edited_member/:x" do
  @member_instance = Member.find(params["x"])
  if @member_instance.name_valid(params["name"])
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
    