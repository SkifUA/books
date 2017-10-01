FactoryGirl.define do
  factory :book do
    title "Example Name"
    author "Example Author"
    summary "a" * Book::SIZE_SUMMARY_FIELD.last
    association :user, factory: :user
  end
end

