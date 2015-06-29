get "/add_media" do
  erb :"medias/add_media_form"
end

get "/list_media" do
  erb :"medias/list_media"
end

get "/save_media" do
  formattype = FormatType.new(params["name"])
  animeseries = AnimeSeries.new(params["title"])
  @new_media = Media.add({"format_type_id" => params["name"].to_i, "anime_series_id" => params["title"].to_i, "cover_name" => params["cover_name"]})
  erb :"medias/media_added"
end

get "/change_media" do
  erb :"medias/change_media"
end

get "/change_media_form/:x" do
  @media = Media.find(params["x"])
  erb :"medias/media"
end

get "/edited_media/:x" do
  @media = Media.find(params["x"])
  erb :"medias/media_changed"
end

get "/delete_media" do
  erb :"medias/delete_media"
end

get "/gone_media" do
  params["media"].each do |media|
    Media.delete_row(media)
  end
  erb :"medias/media_deleted"
end
    