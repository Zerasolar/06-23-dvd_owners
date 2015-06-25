# Calling on the database methods that will be used for most of the classes.
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Media
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :format_type_id, :anime_series_id, :name
  
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
    @name= media_options["name"]
  end
end