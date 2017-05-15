require 'rails_helper'

RSpec.describe "course_semesters/index", type: :view do
  before(:each) do
    assign(:course_semesters, [
      CourseSemester.create!(
        :Semester => nil,
        :Course => nil
      ),
      CourseSemester.create!(
        :Semester => nil,
        :Course => nil
      )
    ])
  end

  it "renders a list of course_semesters" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
