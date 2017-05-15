require 'rails_helper'

RSpec.describe "CourseSemesters", type: :request do
  describe "GET /course_semesters" do
    it "works! (now write some real specs)" do
      get course_semesters_path
      expect(response).to have_http_status(200)
    end
  end
end
