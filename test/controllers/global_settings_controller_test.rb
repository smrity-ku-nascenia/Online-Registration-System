require 'test_helper'
include Warden::Test::Helpers
class GlobalSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @global_setting = global_settings(:one)
    @admin = users(:admin)
    login_as(@admin, scope: :user)
  end

  test "should get new" do
    get new_global_setting_url
    assert_response :success
  end

  test "should get index" do
    get global_setting_url(@global_setting)
    assert_response :success
  end

  test "should show global_setting" do
    get global_setting_url(@global_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_global_setting_url(@global_setting)
    assert_response :success
  end

  test "should create global_setting" do
    assert_difference('GlobalSetting.count', -1) do
      post '/global_setting', params: { global_setting: { current_semester: @global_setting.semester_id } }
    end

    assert_redirected_to global_setting_url(GlobalSetting.last)
  end

  test "authorize_student" do
    get registration_informations_url
    assert_response 500

  end

  test "should update global_setting" do
    patch global_setting_url(@global_setting), params: { global_setting: { current_semester: @global_setting.semester_id } }
    assert_redirected_to global_setting_url(@global_setting)
  end

  test "should destroy global_setting" do
    assert_difference('GlobalSetting.count', -1) do
      delete global_setting_url(@global_setting)
    end

    assert_redirected_to global_settings_url
  end
end
