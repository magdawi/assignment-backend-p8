require "test_helper"

class ListOfUsersTest < Capybara::Rails::TestCase

  test "user#index page contains heading" do
    visit users_path
    assert_content page, "Users"
    refute_button page, "load info"
  end

  test "user#index page contains button load info" do
    Capybara.current_driver = Capybara.javascript_driver
    visit users_path
    save_screenshot('tmp/list_of_users_screenshot.png', :full => true)
    assert_content page, "Users"
    assert_button page, "load info"
  end

  test "creating new user passed" do
    visit new_user_path
    fill_in('First name', with: 'Felix')
    fill_in('Middle initial', with: 'B.')
    fill_in('Last name', with: 'Ketchup')
    fill_in('No stars', with: '4')
    click_button('Create User')

    assert_content page, "User was successfully created."
    assert_content page, "Felix"
    assert_content page, "B."
    assert_content page, "Ketchup"
    assert_content page, "4"
  end

  test "creating new user failed" do
    assert true
  end

end
