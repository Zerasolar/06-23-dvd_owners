get "/add_media" do
  erb :"medias/add_media_form"
end

get "/list_media" do
  erb :"medias/list_media"
end

get "/save_media" do
  @new_media = Media.add({"format_type_id" => params["format_type_id"].to_i, "anime_series_id" => params["anime_series_id"].to_i, "name" => params["name"]})
  erb :"medias/media_added"
end

get "/change_media" do
erb :"medias/change_media"
end

get "/change_media_form/:x" do
@media = Media.find(params["x"])
erb :"medias/media"
end

get "/edited_format_type/:x" do
@media = Media.find(params["x"])
  erb :"format_types/format_type_changed"
end

get "/delete_format_type" do
erb :"format_types/delete_format_type"
end

get "/gone_format_type" do
params["format"].each do |format|
  FormatType.delete_row(format)
end
erb :"format_types/format_type_deleted"
end
    