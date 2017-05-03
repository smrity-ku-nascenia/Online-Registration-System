require 'test_helper'
include Warden::Test::Helpers

class AssignCourseToSemestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assign_course_to_semester = assign_course_to_semesters(:one)
    @admin = users(:admin)
    login_as(@admin, scope: :user)
  end



  test "should get new" do
    get new_assign_course_to_semester_url
    assert_response :success
  end

  test "should create assign_course_to_semester" do
    assert_difference('AssignCourseToSemester.count') do
      post assign_course_to_semesters_url, params: { assign_course_to_semester: { course_id: @assign_course_to_semester.course_id, semerter_id: @assign_course_to_semester.semester_id } }
    end

    assert_redirected_to assign_course_to_semester_url(AssignCourseToSemester.last)
  end

  test "should show assign_course_to_semester" do
    get assign_course_to_semester_url(@assign_course_to_semester)
    assert_response :success
  end

  test "should get edit" do
    get edit_assign_course_to_semester_url(@assign_course_to_semester)
    assert_response :success
  end

  test "should update assign_course_to_semester" do
    patch assign_course_to_semester_url(@assign_course_to_semester), params: { assign_course_to_semester: { course_id: @assign_course_to_semester.course_id, semester_id: @assign_course_to_semester.semester_id } }
    assert_redirected_to assign_course_to_semester_url(@assign_course_to_semester)
  end

  test "should destroy assign_course_to_semester" do
    assert_difference('AssignCourseToSemester.count', -1) do
      delete assign_course_to_semester_url(@assign_course_to_semester)
    end

    assert_redirected_to assign_course_to_semesters_url
  end
end
