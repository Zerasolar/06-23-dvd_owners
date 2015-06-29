get "/add_anime_series" do
  erb :"anime_seriess/add_anime_series_form"
end

get "/info_anime_series" do
  erb :"anime_seriess/search_anime"
end

get "/result_anime_series" do
  num = params.find_ann_id.to_i
  anime_title = ANN_Wrapper.fetch_anime(num)
  @info = anime_title.synopsis
  erb :"anime_seriess/results_anime"
end

get "/list_anime_series" do
  erb :"anime_seriess/list_anime_series"
end

get "/save_anime_series" do
  a = AnimeSeries.new(params)
  valid = a.title_valid(params["title"])
  if valid == false
    erb :"anime_seriess/add_anime_series_form"
    
  elsif a.existing_title
    @new_anime_series = AnimeSeries.add({"title" => params["title"]})
    erb :"anime_seriess/anime_series_added"
    
  else
    
    @error = false
    erb :"anime_seriess/add_anime_series_form"
  end
end


# Incase if I do Api we don't have an issue with two title valid.
# get "/save_anime_series" do
#   a = AnimeSeries.new(params)
#   valid = a.title_valid(params["title"])
#   if valid == false
#     erb :"anime_seriess/add_anime_series_form"
#
#   else
#     @new_anime_series = AnimeSeries.add({"title" => params["title"]})
#     erb :"anime_seriess/anime_series_added"
#   end
# end

get "/change_anime_series" do
  erb :"anime_seriess/change_anime_series"
end

get "/change_anime_series_form/:x" do
  @anime_instance = AnimeSeries.find(params["x"])
  erb :"anime_seriess/anime_series"
end

get "/edited_anime_series/:x" do
  @anime_instance = AnimeSeries.find(params["x"])
  if @anime_instance.title_valid(params["title"])
    @anime_instance.save
    erb :"anime_seriess/anime_series_changed"
  else
    @error = true
    erb :"anime_seriess/anime_series"
  end
end

get "/delete_anime_series" do
  erb :"anime_seriess/delete_anime_series"
end

get "/gone_anime_series" do
  params["anime"].each do |anime|
    AnimeSeries.delete_row(anime)
  end
  erb :"anime_seriess/anime_series_deleted"
end
    