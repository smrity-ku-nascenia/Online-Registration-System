require 'rails_helper'

RSpec.describe "enrollments/edit", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, Enrollment.create!(
      :user => nil,
      :semester => nil,
      :status => "MyString"
    ))
  end

  it "renders the edit enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollment_path(@enrollment), "post" do

      assert_select "input#enrollment_user_id[name=?]", "enrollment[user_id]"

      assert_select "input#enrollment_semester_id[name=?]", "enrollment[semester_id]"

      assert_select "input#enrollment_status[name=?]", "enrollment[status]"
    end
  end
end
