FactoryBot.define do
  factory :admin do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end

end
