FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    sequence(:name) { |n| "Chapter #{n}"}
    content "Lorem ipsum"
    user
  end

  factory :survey do
    sequence(:name)  { |n| "Survey #{n}" }
    micropost
  end

  factory :question do
    content "This is a question."
    survey
  end

  factory :answer do
    content "This is an answer."
    question
  end

  factory :response do
    association :survey
  end
end