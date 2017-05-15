require "rails_helper"

RSpec.describe CourseSemestersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/course_semesters").to route_to("course_semesters#index")
    end

    it "routes to #new" do
      expect(:get => "/course_semesters/new").to route_to("course_semesters#new")
    end

    it "routes to #show" do
      expect(:get => "/course_semesters/1").to route_to("course_semesters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/course_semesters/1/edit").to route_to("course_semesters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/course_semesters").to route_to("course_semesters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/course_semesters/1").to route_to("course_semesters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/course_semesters/1").to route_to("course_semesters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/course_semesters/1").to route_to("course_semesters#destroy", :id => "1")
    end

  end
end
