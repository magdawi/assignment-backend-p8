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

