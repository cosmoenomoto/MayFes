require "test_helper"

class SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sales_index_url
    assert_response :success
  end

  test "should get manage" do
    get sales_manage_url
    assert_response :success
  end
end
