get "/add_media_member" do
  erb :"media_members/add_media_member_form"
end

get "/list_media_member_form" do
  erb :"media_members/list_media_member"
end

get "/save_media_member" do
  formattype = FormatType.new(params["name"])
  animeseries = AnimeSeries.new(params["title"])
  @new_media = Media.add({"format_type_id" => params["name"].to_i, "anime_series_id" => params["title"].to_i, "cover_name" => params["cover_name"]})
  erb :"media_members/media_member_added"
end