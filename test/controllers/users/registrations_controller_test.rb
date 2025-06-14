require "test_helper"

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should assign user to existing family if token provided" do
    family = Family.create!(name: "Existing Family")
    assert_difference "User.count" do
      post user_registration_path, params: { user: { email: "test1@example.com", password: "password", password_confirmation: "password" }, family_token: family.token }
    end
    assert_equal family, User.last.family
  end

  test "should create new family if no token provided" do
    assert_difference [ "User.count", "Family.count" ] do
      post user_registration_path, params: { user: { email: "test2@example.com", password: "password", password_confirmation: "password", family_name: "New Family" } }
    end
    assert_not_nil User.last.family
  end

  test "should create new family with provided family_name if no token provided" do
    family_name = "Custom Family Name"
    assert_difference [ "User.count", "Family.count" ] do
      post user_registration_path, params: { user: { email: "test3@example.com", password: "password", password_confirmation: "password", family_name: family_name } }
    end
    assert_equal family_name, User.last.family.name
  end
end
