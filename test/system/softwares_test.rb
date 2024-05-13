require "application_system_test_case"

class SoftwaresTest < ApplicationSystemTestCase
  setup do
    @software = softwares(:one)
  end

  test "visiting the index" do
    visit softwares_url
    assert_selector "h1", text: "Softwares"
  end

  test "should create software" do
    visit softwares_url
    click_on "New software"

    fill_in "Licence exp date", with: @software.licence_exp_date
    fill_in "Licence number", with: @software.licence_number
    fill_in "Name", with: @software.name
    fill_in "Status", with: @software.status
    click_on "Create Software"

    assert_text "Software was successfully created"
    click_on "Back"
  end

  test "should update Software" do
    visit software_url(@software)
    click_on "Edit this software", match: :first

    fill_in "Licence exp date", with: @software.licence_exp_date
    fill_in "Licence number", with: @software.licence_number
    fill_in "Name", with: @software.name
    fill_in "Status", with: @software.status
    click_on "Update Software"

    assert_text "Software was successfully updated"
    click_on "Back"
  end

  test "should destroy Software" do
    visit software_url(@software)
    click_on "Destroy this software", match: :first

    assert_text "Software was successfully destroyed"
  end
end
