# Calling on the database methods that will be used for most of the classes.
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class MediaMember
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :member_id, :media_id
  
  # Initializes a new Media object
  #
  # media_options - Hash containing key/values.
  # id - Integer Primary key in the 'media' table.
  # format_type_id - Integer in the 'media' table.
  # anime_series_id - Integer in the 'media' table.
  # name - String in the 'media' table.
  #
  # Returns a Media object.
  def initialize(media_member_options={})
    @id= media_member_options["id"]
    @member_id= media_member_options["member_id"]
    @media_id= media_member_options["media_id"]
  end
  
#   def delete_media
#
#     delete = DATABASE.execute("DELETE FROM media_members WHERE member_id = #{id} AND media_id = #{id}")
#   end
#
#   def member_own
#
#     own = DATABASE.execute("SELECT * FROM media_members WHERE member_id = #{id}")
#
# end
end