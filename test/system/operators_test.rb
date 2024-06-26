require "application_system_test_case"

class OperatorsTest < ApplicationSystemTestCase
  setup do
    @operator = operators(:one)
  end

  test "visiting the index" do
    visit operators_url
    assert_selector "h1", text: "Operators"
  end

  test "should create operator" do
    visit operators_url
    click_on "New operator"

    fill_in "Name", with: @operator.name
    click_on "Create Operator"

    assert_text "Operator was successfully created"
    click_on "Back"
  end

  test "should update Operator" do
    visit operator_url(@operator)
    click_on "Edit this operator", match: :first

    fill_in "Name", with: @operator.name
    click_on "Update Operator"

    assert_text "Operator was successfully updated"
    click_on "Back"
  end

  test "should destroy Operator" do
    visit operator_url(@operator)
    click_on "Destroy this operator", match: :first

    assert_text "Operator was successfully destroyed"
  end
end
