# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Joe'
    last_name 'Smith'
    sequence(:email) { |n| "student#{n}@example.com" }
    password 'Password123'
    password_confirmation 'Password123'
  end
end
