FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email 'faker@email.com'
    password 'fakeremail'
  end
end