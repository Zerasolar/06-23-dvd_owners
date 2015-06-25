# Calling on the database methods that will be used for most of the classes.
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class FormatType
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :name
  
  # Initializes a new format type object
  #
  # format_type_options - Hash containing key/values.
  # id - Integer Primary key in the 'format_type' table.
  # name - String of the format's name in the 'format_type' table
  #
  # Returns a FormatType object.
  def initialize(format_type_options={})
    @id = format_type_options["id"]
    @name= format_type_options["name"]
  end
end