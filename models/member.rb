# Calling on the database methods that will be used for most of the classes.
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Member
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :name, :username
  
  # Initializes a new member object
  #
  # member_options - Hash containing key/values.
  # id - Integer Primary key in the 'members' table.
  # name - String of the member's name in the 'members' table
  # username (optional) - String of the member's username for the 'members' table
  #
  # Returns a Member object.
  def initialize(member_options={})
    @id = member_options["id"]
    @name = member_options["name"]
    @username = member_options["username"]
  end
  
  # Checks if the name value is empty.
  #
  # name - String of the member's name.
  #
  # Returns Boolean
  def name_valid(name)
    if !name.empty?
      self.name = name
      return true
    else
      return false
    end
  end
  
  # Checks if there is another username exact same username in the database
  #
  #
  # Returns Boolean
  def existing_username
    valid = true
    existing_username = DATABASE.execute("SELECT * FROM members WHERE username = '#{username}';")
  
    if !existing_username.empty?
      valid = false
    end
    return valid
  end
  
  # List the whole media column of the join table
  #
  # Returns an Array
  
  def self.with_all_media
    results = DATABASE.execute("SELECT members.name, media.cover_name FROM members LEFT JOIN media_members ON members.id = media_members.member_id LEFT JOIN media ON media.id = media_members.media_id;")
  end
  
  # A Join in Sql to select the member to what media they own.
  #
  # Returns an Array
  
  def media_list
    DATABASE.execute("SELECT media.cover_name FROM media_members JOIN media ON media_members.media_id = media.id WHERE media_members.member_id = #{id};")
  end
end