require "application_system_test_case"

class EmpsTest < ApplicationSystemTestCase
  setup do
    @emp = emps(:one)
  end

  test "visiting the index" do
    visit emps_url
    assert_selector "h1", text: "Emps"
  end

  test "creating a Emp" do
    visit emps_url
    click_on "New Emp"

    fill_in "Address", with: @emp.address
    fill_in "Dob", with: @emp.dob
    fill_in "Fname", with: @emp.fname
    fill_in "Lname", with: @emp.lname
    click_on "Create Emp"

    assert_text "Emp was successfully created"
    click_on "Back"
  end

  test "updating a Emp" do
    visit emps_url
    click_on "Edit", match: :first

    fill_in "Address", with: @emp.address
    fill_in "Dob", with: @emp.dob
    fill_in "Fname", with: @emp.fname
    fill_in "Lname", with: @emp.lname
    click_on "Update Emp"

    assert_text "Emp was successfully updated"
    click_on "Back"
  end

  test "destroying a Emp" do
    visit emps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Emp was successfully destroyed"
  end
end
