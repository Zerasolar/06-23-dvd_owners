# Calling on the database methods that will be used for most of the classes.
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class AnimeSeries
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :title
  
  # Initializes a new Anime series object
  #
  # anime_series_options - Hash containing key/values.
  # id - Integer Primary key in the 'anime series' table.
  # title - String of the anime_series title in the 'anime_series' table
  #
  # Returns a AnimeSeries object.
  def initialize(anime_series_options={})
    @id = anime_series_options["id"]
    @title= anime_series_options["title"]
  end
end