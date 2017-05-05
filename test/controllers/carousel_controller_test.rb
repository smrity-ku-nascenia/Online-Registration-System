require 'test_helper'

class CarouselControllerTest < ActionDispatch::IntegrationTest
  test "authorize_student" do
    get registration_informations_url
    assert_redirected_to new_user_session_path
  end

  test "authorize_admin" do
    get global_settings_url
    assert_redirected_to new_user_session_path
  end
end
