require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get new_user_session_path
    assert_template 'sessions/new'
    post new_user_session_path, params: { session: { email: "smrityku@gmail.com", password: "111111" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
