require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "no_stars set to zero" do
    u = User.new
    assert u.no_stars = 0
  end
end
