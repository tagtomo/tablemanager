class CreateTmTables < ActiveRecord::Migration
  def change
    create_table :tm_tables do |t|
      t.string :project_name
      t.string :table_name
      t.string :table_name_jp
      t.string :revision_number
      t.text :note

      t.timestamps
    end
  end
end
