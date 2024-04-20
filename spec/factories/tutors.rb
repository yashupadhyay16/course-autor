FactoryBot.define do
  factory :tutor do
    sequence(:name) { |n| "Tutor #{n}" }
    sequence(:expertise) { |n| "Expertise #{n}" }
    association :course
  end
end