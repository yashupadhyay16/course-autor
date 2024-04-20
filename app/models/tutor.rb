class Tutor < ApplicationRecord
  belongs_to :course

  validates :name, :expertise,  presence: true
end
