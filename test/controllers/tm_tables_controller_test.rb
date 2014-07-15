require 'test_helper'

class TmTablesControllerTest < ActionController::TestCase
  setup do
    @tm_table = tm_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tm_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tm_table" do
    assert_difference('TmTable.count') do
      post :create, tm_table: { note: @tm_table.note, project_name: @tm_table.project_name, revision_number: @tm_table.revision_number, table_name: @tm_table.table_name, table_name_jp: @tm_table.table_name_jp }
    end

    assert_redirected_to tm_table_path(assigns(:tm_table))
  end

  test "should show tm_table" do
    get :show, id: @tm_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tm_table
    assert_response :success
  end

  test "should update tm_table" do
    patch :update, id: @tm_table, tm_table: { note: @tm_table.note, project_name: @tm_table.project_name, revision_number: @tm_table.revision_number, table_name: @tm_table.table_name, table_name_jp: @tm_table.table_name_jp }
    assert_redirected_to tm_table_path(assigns(:tm_table))
  end

  test "should destroy tm_table" do
    assert_difference('TmTable.count', -1) do
      delete :destroy, id: @tm_table
    end

    assert_redirected_to tm_tables_path
  end
end
