class CoursesController < ApplicationController
  def create
    course = Course.new(course_params)
    if course.save
      render json: CourseSerializer.new(course).serializable_hash, status: :created
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  def index
    courses = Course.all.includes(:tutors)
    serialized_courses = courses.map { |course| CourseSerializer.new(course, include: [:tutors]).serializable_hash }
    render json: serialized_courses
  end

  private

  def course_params
    params.require(:course).permit(:name, tutors_attributes: [:name, :expertise])
  end
end