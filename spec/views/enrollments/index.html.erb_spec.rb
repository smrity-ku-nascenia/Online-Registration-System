require 'rails_helper'

RSpec.describe "enrollments/index", type: :view do
  before(:each) do
    assign(:enrollments, [
      Enrollment.create!(
        :user => nil,
        :semester => nil,
        :status => "Status"
      ),
      Enrollment.create!(
        :user => nil,
        :semester => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of enrollments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
