FactoryGirl.define do
  factory :genre do
    name "a" * Genre::SIZE_NAME_FIELD.last
  end
end