require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # setup do
  #   @user = users(:three)
  # end

  # setup do
  #   @folllow = follows()
  # end
  # test "visiting the index" do
  #   visit users_url
  #   assert_selector "h1", text: "Users"
  # end
  #
  # test "creating a User" do
  #   visit users_url
  #   click_on "New User"
  #
  #   fill_in "Email", with: @user.email
  #   fill_in "Name", with: @user.name
  #   fill_in "Password digest", with: @user.password_digest
  #   click_on "Create User"
  #
  #   assert_text "User was successfully created"
  #   click_on "Back"
  # end
  #
  # test "updating a User" do
  #   visit users_url
  #   click_on "Edit", match: :first
  #
  #   fill_in "Email", with: @user.email
  #   fill_in "Name", with: @user.name
  #   fill_in "Password digest", with: @user.password_digest
  #   click_on "Update User"
  #
  #   assert_text "User was successfully updated"
  #   click_on "Back"
  # end
  #
  # test "destroying a User" do
  #   visit users_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "User was successfully destroyed"
  # end
  test "login_fail" do
    visit main_path
    fill_in "Email", with: '1'
    fill_in "Password", with: '2'
    click_on "login"
    assert_text "Password incorrect !!!"
  end

  test "login_success" do
    visit main_path
    fill_in "Email", with: '1'
    fill_in "Password", with: '1'
    click_on "login"
    click_on "logout"
  end

  test "like" do
    visit main_path
    fill_in "Email", with: "1"
    fill_in "Password" , with: "1"
    click_on "login"
    click_on "Create post"
    fill_in "Msg" ,with: "aaaaa"
    click_on "Create Post"
    click_on "logout"
    fill_in "Email", with: "2"
    fill_in "Password" , with: "2"
    click_on "login"
    visit "profile/1"
    click_on "Follow"
    click_on "Home"
    assert_difference('Like.count') do
      click_on "Like" , match: :first
    end
  end
end
