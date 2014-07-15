require 'test_helper'

class TmTableColumnsControllerTest < ActionController::TestCase
  setup do
    @tm_table_column = tm_table_columns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tm_table_columns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tm_table_column" do
    assert_difference('TmTableColumn.count') do
      post :create, tm_table_column: { column_default: @tm_table_column.column_default, column_f_key: @tm_table_column.column_f_key, column_name: @tm_table_column.column_name, column_name_jp: @tm_table_column.column_name_jp, column_null: @tm_table_column.column_null, column_number: @tm_table_column.column_number, column_p_key: @tm_table_column.column_p_key, column_size: @tm_table_column.column_size, column_type: @tm_table_column.column_type, note: @tm_table_column.note, tm_table_id: @tm_table_column.tm_table_id }
    end

    assert_redirected_to tm_table_column_path(assigns(:tm_table_column))
  end

  test "should show tm_table_column" do
    get :show, id: @tm_table_column
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tm_table_column
    assert_response :success
  end

  test "should update tm_table_column" do
    patch :update, id: @tm_table_column, tm_table_column: { column_default: @tm_table_column.column_default, column_f_key: @tm_table_column.column_f_key, column_name: @tm_table_column.column_name, column_name_jp: @tm_table_column.column_name_jp, column_null: @tm_table_column.column_null, column_number: @tm_table_column.column_number, column_p_key: @tm_table_column.column_p_key, column_size: @tm_table_column.column_size, column_type: @tm_table_column.column_type, note: @tm_table_column.note, tm_table_id: @tm_table_column.tm_table_id }
    assert_redirected_to tm_table_column_path(assigns(:tm_table_column))
  end

  test "should destroy tm_table_column" do
    assert_difference('TmTableColumn.count', -1) do
      delete :destroy, id: @tm_table_column
    end

    assert_redirected_to tm_table_columns_path
  end
end
