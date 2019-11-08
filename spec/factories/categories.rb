FactoryBot.define do
  factory :category do
    name { Faker::Name.unique.name }

    trait :with_products do
      after(:create) do |category|
        create(:product, category: category)
      end
    end
  end
end
