require 'rails_helper'

RSpec.describe "course_semesters/new", type: :view do
  before(:each) do
    assign(:course_semester, CourseSemester.new(
      :Semester => nil,
      :Course => nil
    ))
  end

  it "renders new course_semester form" do
    render

    assert_select "form[action=?][method=?]", course_semesters_path, "post" do

      assert_select "input#course_semester_Semester_id[name=?]", "course_semester[Semester_id]"

      assert_select "input#course_semester_Course_id[name=?]", "course_semester[Course_id]"
    end
  end
end
