get "/add_media_member" do
  erb :"media_members/add_media_member_form"
end

get "/list_media_member" do
  erb :"media_members/list_media_member"
end

get "/save_media_member" do
  member = Member.new(params["name"])
  media = Media.new(params["cover_name"])
  @new_media = MediaMember.add({"member_id" => params["name"].to_i, "media_id" => params["cover_name"].to_i})
  erb :"media_members/media_member_added"
end

get "/delete_media_member" do
erb :"media_members/delete_media_member"
end

get "/gone_media_member" do
params["media_member"].each do |media_member|
  MediaMember.delete_row(media_member)
end
erb :"media_member/media_member_deleted"
end
    