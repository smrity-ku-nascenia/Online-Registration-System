require 'test_helper'
include Warden::Test::Helpers
class SemestersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @semester = semesters(:one)
    @admin = users(:admin)
    login_as(@admin, scope: :user)
  end

  test "should get index" do
    get semesters_url
    assert_response :success
  end

  test "should get new" do
    get new_semester_url
    assert_response :success
  end

  test "should create semester" do
    assert_difference('Semester.count') do
      post semesters_url, params: { semester: { semester_id: @semester.semester_id,semester_name: @semester.semester_name } }
    end

    assert_redirected_to semester_url(Semester.last)
  end

  test "should show semester" do
    get semester_url(@semester)
    assert_response :success
  end

  test "should get edit" do
    get edit_semester_url(@semester)
    assert_response :success
  end

  test "should update semester" do
    patch semester_url(@semester), params: { semester: { semester_id: @semester.semester_id, semester_name: @semester.semester_name } }
    assert_redirected_to semester_url(@semester)
  end

  test "should destroy semester" do
    assert_difference('Semester.count', -1) do
      delete semester_url(@semester)
    end

    assert_redirected_to semesters_url
  end
end
