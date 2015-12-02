require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "no_stars set to zero" do
    u = User.new
    assert u.no_stars = 0
  end

  test "add_star! add one star" do
    u = User.new
    u.add_star!
    assert u.no_stars = 1
  end
end
