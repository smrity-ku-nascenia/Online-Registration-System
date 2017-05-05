require 'test_helper'


include Warden::Test::Helpers

class RegistrationInformationsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @registration_information = registration_informations(:two)
    @registration_information1 = registration_informations(:one)

    @student = users(:student)
    login_as(@student, scope: :user)
  end

  test "should get index" do

    get registration_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_information_url
    assert_response :success
  end

  test "should show course" do
    get showcourse_url, :format => 'js', :semester_id => @registration_information.semester_id
    assert_response :ok
  end


  test "should see my result" do
    get see_my_result_url
    assert_response :success
  end

  test "should see populate_completed_courses" do
    get populate_completed_courses_url
    assert_response :success
  end

  test "authorize_admin" do
    get global_settings_url
    assert_response 500

  end

  test "should create registration_information" do

    assert_difference('RegistrationInformation.count',0) do
      post registration_informations_url(@registration_information1), params: { registration_information: { student_id: @registration_information1.student_id, semester_id: @registration_information1.semester_id, course_id: @registration_information1.course_id, mark: @registration_information1.mark, grade: @registration_information1.grade } }
    end
    assert_redirected_to registration_informations_url
  end

  test "should update registration_information" do
    patch registration_information_url(@registration_information), params: { registration_information: { student_id: @registration_information.student_id, semester_id: @registration_information.semester_id, course_id: @registration_information.course_id, mark: @registration_information.mark, grade: @registration_information.grade } }
    assert_redirected_to (@registration_information)
  end

  test "should not update registration_information" do
    patch registration_information_url(@registration_information1), params: { registration_information: { semester_id: @registration_information1.semester_id, course_id: @registration_information1.course_id, mark: @registration_information1.mark, grade: @registration_information1.grade } }
    assert_redirected_to registration_information_url(@registration_information1)
  end

  test "should destroy registration_information" do
    assert_difference('RegistrationInformation.count', -1) do
      delete registration_information_url(@registration_information)
    end
    assert_redirected_to registration_informations_url
  end


end
