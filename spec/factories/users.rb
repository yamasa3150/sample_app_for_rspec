FactoryBot.define do
  factory :user do
    email { |n| "aaa#{n}@bbb.ccc" }
    password { "password" }
    password_confirmation { "password" }
  end
end
