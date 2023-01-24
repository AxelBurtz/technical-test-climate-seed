require "test_helper"

class Admin::VintagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_vintages_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_vintages_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_vintages_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_vintages_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_vintages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_vintages_destroy_url
    assert_response :success
  end
end
