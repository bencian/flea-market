FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Name.name }
    code { Faker::Number.number(digits: 10) }
    price { Faker::Number.decimal(l_digits: 2) }
    cost { Faker::Number.decimal(l_digits: 2) }
    active { true }
    category { build(:category) }

    transient do
      image_count { 2 }
    end

    trait :with_several_product_images do
      after(:create) do |product,options|
        create_list(:product_image, options.image_count, product: product)
      end
    end

    trait :with_one_product_image do
      after(:create) do |product|
        create(:product_image, product: product)
      end
    end
  end
end
