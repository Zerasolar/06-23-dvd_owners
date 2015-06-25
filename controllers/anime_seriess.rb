get "/add_anime_series" do
  erb :"anime_seriess/add_anime_series_form"
end

get "/list_anime_series" do
  erb :"anime_seriess/list_anime_series"
end

get "/save_anime_series" do
  a = AnimeSeries.new(params)
  valid = a.title_valid(params["title"])
  if valid == false
    erb :"anime_seriess/add_anime_series_form"
  
  else
    @new_anime_series = AnimeSeries.add({"title" => params["title"]})
    erb :"anime_seriess/anime_series_added"
  end
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
    