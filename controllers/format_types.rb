get "/add_format_type" do
  erb :"format_types/add_format_type_form"
end

get "/list_format_type" do
  erb :"format_types/list_format_type"
end

get "/save_format_type" do
  f = FormatType.new(params)
  valid = f.name_valid(params["name"])
  if valid == false
    erb :"format_types/add_format_type_form"
  
  elsif f.existing_format
    @new_format = FormatType.add({"name" => params["name"]})
    erb :"format_types/format_type_added"
    
  else
    
    @error = false
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
    