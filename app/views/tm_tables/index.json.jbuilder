json.array!(@tm_tables) do |tm_table|
  json.extract! tm_table, :id, :project_name, :table_name, :table_name_jp, :revision_number, :note
  json.url tm_table_url(tm_table, format: :json)
end
