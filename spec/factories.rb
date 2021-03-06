FactoryGirl.define do

  factory :user do

    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar69"
    password_confirmation "foobar69"
    account_active true

    factory :admin do
      admin true
    end
  end

  factory :fable do
    sequence(:name) { |n| "Chapter #{n}"}
    content "Lorem ipsum"
    user
  end
end
