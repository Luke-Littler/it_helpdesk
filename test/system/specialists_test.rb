require "application_system_test_case"

class SpecialistsTest < ApplicationSystemTestCase
  setup do
    @specialist = specialists(:one)
  end

  test "visiting the index" do
    visit specialists_url
    assert_selector "h1", text: "Specialists"
  end

  test "should create specialist" do
    visit specialists_url
    click_on "New specialist"

    fill_in "Email", with: @specialist.email
    fill_in "Name", with: @specialist.name
    fill_in "Phone", with: @specialist.phone
    click_on "Create Specialist"

    assert_text "Specialist was successfully created"
    click_on "Back"
  end

  test "should update Specialist" do
    visit specialist_url(@specialist)
    click_on "Edit this specialist", match: :first

    fill_in "Email", with: @specialist.email
    fill_in "Name", with: @specialist.name
    fill_in "Phone", with: @specialist.phone
    click_on "Update Specialist"

    assert_text "Specialist was successfully updated"
    click_on "Back"
  end

  test "should destroy Specialist" do
    visit specialist_url(@specialist)
    click_on "Destroy this specialist", match: :first

    assert_text "Specialist was successfully destroyed"
  end
end
