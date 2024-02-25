require "test_helper"

class AriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arium = aria(:one)
  end

  test "should get index" do
    get aria_url
    assert_response :success
  end

  test "should get new" do
    get new_arium_url
    assert_response :success
  end

  test "should create arium" do
    assert_difference("Arium.count") do
      post aria_url, params: { arium: { name: @arium.name } }
    end

    assert_redirected_to arium_url(Arium.last)
  end

  test "should show arium" do
    get arium_url(@arium)
    assert_response :success
  end

  test "should get edit" do
    get edit_arium_url(@arium)
    assert_response :success
  end

  test "should update arium" do
    patch arium_url(@arium), params: { arium: { name: @arium.name } }
    assert_redirected_to arium_url(@arium)
  end

  test "should destroy arium" do
    assert_difference("Arium.count", -1) do
      delete arium_url(@arium)
    end

    assert_redirected_to aria_url
  end
end
