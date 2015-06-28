
get "/add_media_member" do
  erb :"media_members/add_media_member_form"
end

get "/list_media_member" do
  erb :"media_members/list_media_member"
end

get "/list_media_member" do
  erb :"media_members/list_media_member"
end

get "/save_media_member" do
  member = Member.new(params["name"])
  media = Media.new(params["cover_name"])
  @new_media_member = MediaMember.add({"member_id" => params["name"].to_i, "media_id" => params["cover_name"].to_i})
  erb :"media_members/media_member_added"
end

get "/delete_media_member" do
  erb :"media_members/delete_media_member"
end

get "/sort" do
  erb :"media_members/sort_menu"
end

get "/select_member" do
  erb :"media_members/select_member"
end

get "/select_media" do
end