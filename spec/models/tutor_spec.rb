require 'rails_helper'

RSpec.describe Tutor, type: :model do
  context "associations" do
    it "belongs to a course" do
      association = described_class.reflect_on_association(:course)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  context "validations" do
    it "validates presence of name" do
      tutor = build(:tutor, name: nil)
      expect(tutor).not_to be_valid
      expect(tutor.errors[:name]).to include("can't be blank")
    end

    it "validates presence of expertise" do
      tutor = build(:tutor, expertise: nil)
      expect(tutor).not_to be_valid
      expect(tutor.errors[:expertise]).to include("can't be blank")
    end
  end
end
