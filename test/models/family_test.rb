require "test_helper"

class FamilyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should generate a token on creation" do
    family = Family.create!(name: "Test Family")
    assert_not_nil family.token
  end

  test "should ensure token uniqueness" do
    family1 = Family.create!(name: "Family 1")
    family2 = Family.create!(name: "Family 2")
    assert_not_equal family1.token, family2.token
  end
end
