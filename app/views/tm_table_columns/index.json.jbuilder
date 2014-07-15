json.array!(@tm_table_columns) do |tm_table_column|
  json.extract! tm_table_column, :id, :column_number, :column_name, :column_name_jp, :column_type, :column_size, :column_null, :column_default, :column_p_key, :column_f_key, :note, :tm_table_id
  json.url tm_table_column_url(tm_table_column, format: :json)
end
