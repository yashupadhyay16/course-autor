require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "POST #create" do
    let(:valid_course_params) do
      {
        course: {
          name: "Course Name",
          tutors_attributes: [
            { name: "Tutor 1", expertise: "Expertise 1" },
            { name: "Tutor 2", expertise: "Expertise 2" }
          ]
        }
      }
    end

    let(:invalid_course_params) do
      {
        course: {
          name: nil, # Invalid parameter
          tutors_attributes: [
            { name: "Tutor 1", expertise: "Expertise 1" }
          ]
        }
      }
    end

    context "with valid parameters" do
      it "creates a new course with tutors" do
        expect {
          post :create, params: valid_course_params
        }.to change(Course, :count).by(1)
         .and change(Tutor, :count).by(2)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["name"]).to eq("Course Name")
        expect(JSON.parse(response.body)["tutors"].count).to eq(2)
      end
    end

    context "with invalid parameters" do
      it "returns unprocessable entity status" do
        post :create, params: invalid_course_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "returns all courses with associated tutors" do
      course1 = create(:course, name: "Computer Science")
      course2 = create(:course, name: "Mathematics")
      tutor1 = create(:tutor, name: "Tutor 1", expertise: "Expertise 1", course: course1)
      tutor2 = create(:tutor, name: "Tutor 2", expertise: "Expertise 2", course: course2)

      get :index
      courses_response = JSON.parse(response.body)

      expect(courses_response.length).to eq(2)

      expect(courses_response[0]["name"]).to eq(course1.name)
      expect(courses_response[0]["tutors"].length).to eq(1)
      expect(courses_response[0]["tutors"][0]["name"]).to eq(tutor1.name)
      expect(courses_response[0]["tutors"][0]["expertise"]).to eq(tutor1.expertise)

      expect(courses_response[1]["name"]).to eq(course2.name)
      expect(courses_response[1]["tutors"].length).to eq(1)
      expect(courses_response[1]["tutors"][0]["name"]).to eq(tutor2.name)
      expect(courses_response[1]["tutors"][0]["expertise"]).to eq(tutor2.expertise)
    end
  end
end
