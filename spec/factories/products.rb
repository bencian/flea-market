FactoryBot.define do
  factory :product do
    name { Faker::Name.unique.name }
    description { Faker::Name.name }
    code { Faker::Number.unique.number(digits: 10) }
    price { Faker::Number.decimal(l_digits: 2) }
    cost { Faker::Number.decimal(l_digits: 2) }
    active { true }
    association :category
    after(:build) do |product|
      product_image = build(:product_image, product: product)
      product.product_images << product_image
    end
  end
end
