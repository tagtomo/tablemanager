class TmTable < ActiveRecord::Base
  has_many :tm_table_columns,->{order("column_number ASC") }
  accepts_nested_attributes_for :tm_table_columns , allow_destroy: true

  def to_gentext
  	sfdata = "rails generate scaffold " + self[:table_name]
  	self.tm_table_columns.each do |tm_table_column|
      case tm_table_column[:column_type]
  	  when "character"
  		column_type = "string"
  	  when "numeric"
  		column_type = "integer"
  	  else
  	  	column_type = tm_table_column[:column_type]
  	  end
  	  sfdata << " " + tm_table_column[:column_name] + ":" + column_type
      p sfdata
  	end
  	p sfdata
  end
end
