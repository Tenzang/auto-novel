require "test_helper"

class ExcerptsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get excerpts_new_url
    assert_response :success
  end

  test "should get edit" do
    get excerpts_edit_url
    assert_response :success
  end

  test "should get show" do
    get excerpts_show_url
    assert_response :success
  end
end
