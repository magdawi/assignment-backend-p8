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

end
