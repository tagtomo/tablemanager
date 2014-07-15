class CreateTmTableColumns < ActiveRecord::Migration
  def change
    create_table :tm_table_columns do |t|
      t.integer :column_number
      t.string :column_name
      t.string :column_name_jp
      t.string :column_type
      t.string :column_size
      t.boolean :column_null
      t.string :column_default
      t.boolean :column_p_key
      t.boolean :column_f_key
      t.text :note
      t.integer :tm_table_id

      t.timestamps
    end
  end
end
