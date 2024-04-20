require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "associations" do
    it "has many tutors" do
      association = described_class.reflect_on_association(:tutors)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe "validations" do
    it "validates presence of name" do
      course = build(:course, name: nil)
      expect(course).not_to be_valid
      expect(course.errors[:name]).to include("can't be blank")
    end
  end

  describe "creation" do
    it "can be created with valid attributes" do
      course = create(:course, name: "Example Course")
      expect(course).to be_valid
    end

    it "creates a new course" do
      expect {
        create(:course, name: "Example Course")
      }.to change(described_class, :count).by(1)
    end
  end
end
