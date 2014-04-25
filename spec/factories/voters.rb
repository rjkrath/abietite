FactoryGirl.define do
  factory :voter do
    sequence(:email) { |n| "email#{n}@email.com" }

  end
end
