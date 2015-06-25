require "active_support"
require "active_support/inflector"
require_relative "database_class_methods.rb"
# Connection to the other database just in case and uses active support for the table_name.
module DatabaseInstanceMethods
  extend DatabaseClassMethods
  
  # Updates the row of values in a table.
  #
  # Returns it self. As a object.
  
  def save
    table_name = self.class.to_s.pluralize.underscore
 
    instance_variables = self.instance_variables
 
    attribute_hash = {}
 
    instance_variables.each do |variable|
      attribute_hash["#{variable.slice(1..-1)}"] = self.send("#{variable.slice(1..-1)}")
    end
 
    individual_instance_variables = []
 
    attribute_hash.each do |key, value|
      if value.is_a?(String)
        individual_instance_variables << "#{key} = '#{value}'"
      else
        individual_instance_variables << "#{key} = #{value}"
      end
    end
 
    for_sql = individual_instance_variables.join(', ')
    DATABASE.execute("UPDATE #{table_name} SET #{for_sql} WHERE id = #{id}")
 
    return self
  end
end
