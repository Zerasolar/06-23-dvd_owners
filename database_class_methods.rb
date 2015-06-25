require "active_support"
require "active_support/inflector"

  # This module will extend to all of classes. It contains methods that will become class methods for the class.

module DatabaseClassMethods

  # Add a new record to the database.
  #
  # Returns an Object.
  
  def add(options={})
    # Options pull the initalize values from a table
    column_names = options.keys
    values = options.values
    

    column_names_for_sql = column_names.join(", ")
    individual_values_for_sql = []
    values.each do |value|
      #another way to do it values.to_s.delete("\[\]")
      if value.is_a?(String)
        individual_values_for_sql << "'#{value}'"
      else
        individual_values_for_sql << value
      end
    end
    values_for_sql = individual_values_for_sql.join(", ")
    
    table_name = self.to_s.pluralize.underscore
        
    DATABASE.execute("INSERT INTO #{table_name} (#{column_names_for_sql}) VALUES (#{values_for_sql});")
    
    id = DATABASE.last_insert_row_id
    options["id"] = id
    self.new(options)
  end
  
  # Gets all the rows in a table
  #
  # Returns an Array containing Objects for each row.
  
  def all
    table_name = self.to_s.pluralize.underscore
    results = DATABASE.execute("SELECT * FROM #{table_name}")
    
    results_as_objects = []
    
    results.each do |result_hash|
      results_as_objects << self.new(result_hash)
    end
    return results_as_objects
  end  
  # Get a single row.
  #
  # id - The id for record in a table
  #
  # Returns an Array containing the Hash of the row.
  def find(id)
    table_name = self.to_s.pluralize.underscore
    results = DATABASE.execute("SELECT * FROM #{table_name} WHERE id = #{id}").first
    self.new(results)
  end
  
  # Delete a single row in a table.
  #
  # id - The id for the record in a table
  #
  # Returns a empty Array
  
  def delete_row(id)
    table_name = self.to_s.pluralize.underscore
    DATABASE.execute("DELETE FROM #{table_name} WHERE id = #{id}")
  end
  # Delete a table.
  #
  # Returns nil
  def delete_table
    table_name = self.to_s.pluralize.underscore
    DATABASE.execute("DROP TABLE #{table_name}")
  end
end