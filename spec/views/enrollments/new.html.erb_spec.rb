require 'rails_helper'

RSpec.describe "enrollments/new", type: :view do
  before(:each) do
    assign(:enrollment, Enrollment.new(
      :user => nil,
      :semester => nil,
      :status => "MyString"
    ))
  end

  it "renders new enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollments_path, "post" do

      assert_select "input#enrollment_user_id[name=?]", "enrollment[user_id]"

      assert_select "input#enrollment_semester_id[name=?]", "enrollment[semester_id]"

      assert_select "input#enrollment_status[name=?]", "enrollment[status]"
    end
  end
end
