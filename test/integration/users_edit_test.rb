require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest


  def setup
    @user = users(:adam)
  end

   test "unsuccessful edit" do
     log_in_as(@user)
     get edit_user_path(@user)
     assert_template 'users/edit'
     patch user_path(@user), params: { user: { name: '',
                                               email: 'foo@invalid.com',
                                               password:              'invalid',
                                               password_confirmation: 'pass' } }
     assert_template 'users/edit'
   end

   test "successful edit" do
     log_in_as(@user)
     get edit_user_path(@user)
     assert_template 'users/edit'
     name = "Foo Bar"
     email = "foo@bar.com"
     patch user_path(@user), params: { user: { name: name,
                                               email: email,
                                               password:              '',
                                               password_confirmation: '' } }
     assert_not flash.empty?
     assert_redirected_to @user
     @user.reload
     assert_equal name, @user.name
     assert_equal email, @user.email
   end

   test "should redirect edit when not logged in" do
     get edit_user_path(@user)
     assert_not flash.empty?
     assert_redirected_to login_url
   end

   test "should redirect update when not logged in" do
     patch user_path(@user), params: { user: { name: @user.name,
                                            email: @user.email } }
     assert_not flash.empty?
     assert_redirected_to login_url
   end

end
