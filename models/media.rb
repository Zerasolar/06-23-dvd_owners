# Calling on the database methods that will be used for most of the classes.
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Media
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :format_type_id, :anime_series_id, :cover_name
  
  # Initializes a new Media object
  #
  # media_options - Hash containing key/values.
  # id - Integer Primary key in the 'media' table.
  # format_type_id - Integer in the 'media' table.
  # anime_series_id - Integer in the 'media' table.
  # name - String in the 'media' table.
  #
  # Returns a Media object.
  def initialize(media_options={})
    @id = media_options["id"]
    @format_type_id= media_options["format_type_id"]
    @anime_series_id= media_options["anime_series_id"]
    @cover_name= media_options["cover_name"]
  end
  
  # A Join in Sql to select the member to what media they own.
  #
  # Returns an Array
  
  
  # A Join in Sql to select the media to see who all own it.
  #
  # Returns an Array
  
  def member_list
    DATABASE.execute("SELECT members.name FROM media_members JOIN members ON media_members.member_id = members.id WHERE media_members.media_id = #{id};")
  end
end
