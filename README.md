Nico Deufemia & Magdalena Wimmer

## Stars

a ruby on rails 4.1 example app to learn about testing

clone this repository, then

    bundle
    rake db:migrate
    rake db:seed
    rails server

now point your browser at the homepage at http://localhost:3000/

You will be asked to

* write unit tests for models
* write feature tests with capibara that test non-js features
* write feature tests with poltergeist that test js features

To run the tests

    rake test

You will have to install webkit separately.
on mac os use this:

brew install qt5
brew link --force  qt5

On Ubuntu use this:

sudo apt-get install qt5-default libqt5webkit5-dev

On Windows refer to this guide:

https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit

## Log:

1. Run the tests
       using rake test. Do all the tests pass?
> All tests and assertion passed successfully!

2. Find the Model Test
       Find the file that contains tests for model User
> found in file: test/models/user_test.rb

3. Model Test: default value
                   Write a test to check that a newly created user has a `no_stars` set to zero. This test should immediately pass, the default value was set correctly in the migration that created the users table.
```ruby
test "no_stars set to zero" do
u = User.new
assert u.no_stars = 0
end
````

4. TDD: a new method
            In the user model, there should be a method `add_star!` that increases the number by one.
Write the test first. Make sure it fails, then implement the changes in the model and make sure the test passes now.
```ruby
test "add_star! add one star" do
u = User.new
u.add_star!
assert u.no_stars = 1
end
````

5. Find the Feature Test
       Find the file that already contains two feature tests. What do they test for. Which test uses JavaScript and which doesn't? The javascript driver can save screenshots. Before you look at the screenshot: discuss what you expect it to show! Then find the screenshot and compare.
> The file which already contains two feature tests is located in: test/features/list_of_users_test.rb
The test "user#index page contains heading" [don't uses js]
                                                - visits the page users#index
                                                - tests content for "Users"
                                                - tests non-existence of "load info" Button

The test "user#index page contains button load info" [uses js]
- loads and uses Capybara.javascript_driver for javascript capability
- visists the page users#index
- saves screenshot from visited page to tmp path
- tests content for "Users"
- tests existence of "load info" Button

Discussion about Screenshot-containments:
- We expect the screenshot to contain all rendered html elements on their right place with executed javascript.
- It may only show the test users instead of the dev/production seeds
- found in tmp/lists_of_users_screenshot.png (stated path in test)

6. Feature Test: create a user
Add feature tests for new user (one test for creating a new user is successful & one for creating a new user fails) -> screenshots saved

> validation checks if 'Middle initial' length is maximal 2
> user "Felix B. Ketchup" is successfully created
> user "Heinrich Fe. Senf" fails

7. TDD: a new feature
Write feature test for increasing-stars-button before implementing the button.

> added test which visits user_path(1) and clicks button "Add Star"
> checks if in index name of index shows right number of stars and takes screenshot

INFO: in fixtures id-attribute is missing - added ids to fixtures to enable visiting user_path(1)

after writing the test:
> added button to show.html.erb with button_to
  - links to users_path
  - uses method get, because no param is given
  - used action to update users no_stars (:action => @user.update(:no_stars => @user.no_stars+1))

8. Feature Test with javascript: load info with AJAX
check if the outputbox appears when 'load info'-button is clicked

> visit users index
> to check that output is empty before clicking used 'refute_content page' and saving screenshot
> then clicking button 'load info'
> checking content of page with 'asert_content page'

> changed url in app/assets/javascripts/application.js -> test fails -> fixed again

9. TDD: add stars with AJAX


