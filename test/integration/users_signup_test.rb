require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid sign-up information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "user@invalid.com",
                                         password:              "foo",
                                         password_confirmation: "foobar" } }
    end
  end

  test 'valid sign-up information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "User",
                                         email: "user@exp.com",
                                         password: "Valid_Pass",
                                         password_confirmation: "Valid_Pass" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end