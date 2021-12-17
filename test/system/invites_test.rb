require "application_system_test_case"

class InvitesTest < ApplicationSystemTestCase
  setup do
    @invite = invites(:one)
  end

  test "visiting the index" do
    visit invites_url
    assert_selector "h1", text: "Invites"
  end

  test "creating a Invite" do
    visit invites_url
    click_on "New Invite"

    fill_in "Address", with: @invite.address
    fill_in "Referal code", with: @invite.referal_code
    click_on "Create Invite"

    assert_text "Invite was successfully created"
    click_on "Back"
  end

  test "updating a Invite" do
    visit invites_url
    click_on "Edit", match: :first

    fill_in "Address", with: @invite.address
    fill_in "Referal code", with: @invite.referal_code
    click_on "Update Invite"

    assert_text "Invite was successfully updated"
    click_on "Back"
  end

  test "destroying a Invite" do
    visit invites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invite was successfully destroyed"
  end
end
