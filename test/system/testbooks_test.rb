require "application_system_test_case"

class TestbooksTest < ApplicationSystemTestCase
  setup do
    @testbook = testbooks(:one)
  end

  test "visiting the index" do
    visit testbooks_url
    assert_selector "h1", text: "Testbooks"
  end

  test "should create testbook" do
    visit testbooks_url
    click_on "New testbook"

    fill_in "Name", with: @testbook.name
    fill_in "Name kana", with: @testbook.name_kana
    click_on "Create Testbook"

    assert_text "Testbook was successfully created"
    click_on "Back"
  end

  test "should update Testbook" do
    visit testbook_url(@testbook)
    click_on "Edit this testbook", match: :first

    fill_in "Name", with: @testbook.name
    fill_in "Name kana", with: @testbook.name_kana
    click_on "Update Testbook"

    assert_text "Testbook was successfully updated"
    click_on "Back"
  end

  test "should destroy Testbook" do
    visit testbook_url(@testbook)
    click_on "Destroy this testbook", match: :first

    assert_text "Testbook was successfully destroyed"
  end
end
