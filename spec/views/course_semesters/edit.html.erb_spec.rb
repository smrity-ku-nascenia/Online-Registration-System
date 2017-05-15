require 'rails_helper'

RSpec.describe "course_semesters/edit", type: :view do
  before(:each) do
    @course_semester = assign(:course_semester, CourseSemester.create!(
      :Semester => nil,
      :Course => nil
    ))
  end

  it "renders the edit course_semester form" do
    render

    assert_select "form[action=?][method=?]", course_semester_path(@course_semester), "post" do

      assert_select "input#course_semester_Semester_id[name=?]", "course_semester[Semester_id]"

      assert_select "input#course_semester_Course_id[name=?]", "course_semester[Course_id]"
    end
  end
end
