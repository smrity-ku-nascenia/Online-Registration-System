require 'test_helper'
include Warden::Test::Helpers
class RegistrationInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration_information = registration_informations(:one)
    @student = users(:student)
    login_as(@student, scope: :user)
  end

  test "should get index" do
    get registration_informations_url
    assert_response :success
  end

end
