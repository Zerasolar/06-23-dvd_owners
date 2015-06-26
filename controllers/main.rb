#---------------------------------------------------------------------
# Main
#---------------------------------------------------------------------

get "/home" do
  erb :"mainmenu"
end

get "/member_menu" do
  erb :"members/member_menu"
end

get "/anime_series_menu" do
  erb :"anime_seriess/anime_series_menu"
end

get "/format_type_menu" do
  erb :"format_types/format_type_menu"
end

get "/media_menu" do
  erb :"medias/media_menu"
end

get "/media_member_menu" do
  erb :"media_members/media_member_menu"
end