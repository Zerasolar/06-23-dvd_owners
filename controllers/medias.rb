get "/add_media" do
  erb :"medias/add_media"
end

get "/list_media" do
  erb :"medias/list_media"
end

get "/save_media" do
  m = Media.new(params)
  valid = m.name_valid(params["name"])
  if valid == false
    erb :"medias/add_medias"
    
  else
    
    @error = true
    erb :"format_types/add_format_type_form"
  end
end

get "/change_format_type" do
  erb :"format_types/change_format_type"
end

get "/change_format_type_form/:x" do
  @format_instance = FormatType.find(params["x"])
  erb :"format_types/format_type"
end

get "/edited_format_type/:x" do
  @format_instance = FormatType.find(params["x"])
  if @format_instance.name_valid(params["name"])
    @format_instance.save
    erb :"format_types/format_type_changed"
  else
    @error = true
    erb :"format_types/format_type"
  end
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
    