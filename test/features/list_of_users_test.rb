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
    Capybara.current_driver = Capybara.javascript_driver
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
    save_screenshot('tmp/new_user_passed_screenshot.png', :full => true)
  end

  test "creating new user failed" do
    Capybara.current_driver = Capybara.javascript_driver
    visit new_user_path
    fill_in('First name', with: 'Heinrich')
    fill_in('Middle initial', with: 'Fe.')
    fill_in('Last name', with: 'Senf')
    fill_in('No stars', with: '2')
    click_button('Create User')

    assert_content page, "prohibited this user from being saved"
    save_screenshot('tmp/new_user_failed_screenshot.png', :full => true)
  end

  test "right number of stars is showed" do
    Capybara.current_driver = Capybara.javascript_driver
    visit user_path(1)
    click_button('Add Star')

    assert_content page, "John F. Kennedy * " 
    save_screenshot('tmp/users_index_screenshot.png', :full => true)
  end

  test "output box for information runs" do
    Capybara.current_driver = Capybara.javascript_driver
    visit users_path
    refute_content page, 'There are'
    save_screenshot('tmp/output_box_empty_screenshot.png', :full => true)
    click_button('load info')

    assert_content page, 'There are'
    save_screenshot('tmp/output_box_filled_screenshot.png', :full => true)
  end
end
