FactoryGirl.define do
  factory :entry do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
    body { Faker::Lorem.paragraphs(paragraph_count = 3) }
  end
end
