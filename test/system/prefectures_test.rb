require "application_system_test_case"

class PrefecturesTest < ApplicationSystemTestCase
  setup do
    @prefecture = prefectures(:one)
  end

  test "visiting the index" do
    visit prefectures_url
    assert_selector "h1", text: "Prefectures"
  end

  test "should create prefecture" do
    visit prefectures_url
    click_on "New prefecture"

    fill_in "Area", with: @prefecture.area_id
    fill_in "Name", with: @prefecture.name
    click_on "Create Prefecture"

    assert_text "Prefecture was successfully created"
    click_on "Back"
  end

  test "should update Prefecture" do
    visit prefecture_url(@prefecture)
    click_on "Edit this prefecture", match: :first

    fill_in "Area", with: @prefecture.area_id
    fill_in "Name", with: @prefecture.name
    click_on "Update Prefecture"

    assert_text "Prefecture was successfully updated"
    click_on "Back"
  end

  test "should destroy Prefecture" do
    visit prefecture_url(@prefecture)
    click_on "Destroy this prefecture", match: :first

    assert_text "Prefecture was successfully destroyed"
  end
end
