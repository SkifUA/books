FactoryGirl.define do
  factory :user do
    id 1
    name "Example User"
    email "user@example.com"
    password '111111'
    password_confirmation '111111'
    admin true
  end
end