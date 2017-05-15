require 'rails_helper'

RSpec.describe "course_semesters/show", type: :view do
  before(:each) do
    @course_semester = assign(:course_semester, CourseSemester.create!(
      :Semester => nil,
      :Course => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
