require "application_system_test_case"

class AriaTest < ApplicationSystemTestCase
  setup do
    @arium = aria(:one)
  end

  test "visiting the index" do
    visit aria_url
    assert_selector "h1", text: "Aria"
  end

  test "should create arium" do
    visit aria_url
    click_on "New arium"

    fill_in "Name", with: @arium.name
    click_on "Create Arium"

    assert_text "Arium was successfully created"
    click_on "Back"
  end

  test "should update Arium" do
    visit arium_url(@arium)
    click_on "Edit this arium", match: :first

    fill_in "Name", with: @arium.name
    click_on "Update Arium"

    assert_text "Arium was successfully updated"
    click_on "Back"
  end

  test "should destroy Arium" do
    visit arium_url(@arium)
    click_on "Destroy this arium", match: :first

    assert_text "Arium was successfully destroyed"
  end
end
