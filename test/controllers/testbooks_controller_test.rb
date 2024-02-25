require "test_helper"

class TestbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testbook = testbooks(:one)
  end

  test "should get index" do
    get testbooks_url
    assert_response :success
  end

  test "should get new" do
    get new_testbook_url
    assert_response :success
  end

  test "should create testbook" do
    assert_difference("Testbook.count") do
      post testbooks_url, params: { testbook: { name: @testbook.name, name_kana: @testbook.name_kana } }
    end

    assert_redirected_to testbook_url(Testbook.last)
  end

  test "should show testbook" do
    get testbook_url(@testbook)
    assert_response :success
  end

  test "should get edit" do
    get edit_testbook_url(@testbook)
    assert_response :success
  end

  test "should update testbook" do
    patch testbook_url(@testbook), params: { testbook: { name: @testbook.name, name_kana: @testbook.name_kana } }
    assert_redirected_to testbook_url(@testbook)
  end

  test "should destroy testbook" do
    assert_difference("Testbook.count", -1) do
      delete testbook_url(@testbook)
    end

    assert_redirected_to testbooks_url
  end
end
