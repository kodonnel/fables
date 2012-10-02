FactoryGirl.define do
  factory :user do
    name     "Kaitlin O'Donnell"
    email    "kat.odonnel@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end