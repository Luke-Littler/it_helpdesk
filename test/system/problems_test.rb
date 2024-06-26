require "application_system_test_case"

class ProblemsTest < ApplicationSystemTestCase
  setup do
    @problem = problems(:one)
  end

  test "visiting the index" do
    visit problems_url
    assert_selector "h1", text: "Problems"
  end

  test "should create problem" do
    visit problems_url
    click_on "New problem"

    fill_in "Problem sub type", with: @problem.problem_sub_type
    fill_in "Problem type", with: @problem.problem_type
    fill_in "Status", with: @problem.status
    click_on "Create Problem"

    assert_text "Problem was successfully created"
    click_on "Back"
  end

  test "should update Problem" do
    visit problem_url(@problem)
    click_on "Edit this problem", match: :first

    fill_in "Problem sub type", with: @problem.problem_sub_type
    fill_in "Problem type", with: @problem.problem_type
    fill_in "Status", with: @problem.status
    click_on "Update Problem"

    assert_text "Problem was successfully updated"
    click_on "Back"
  end

  test "should destroy Problem" do
    visit problem_url(@problem)
    click_on "Destroy this problem", match: :first

    assert_text "Problem was successfully destroyed"
  end
end
