require 'rails_helper'

RSpec.describe "enrollments/show", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, Enrollment.create!(
      :user => nil,
      :semester => nil,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
  end
end
