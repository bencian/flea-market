FactoryBot.define do
  factory :tag do
    name { Faker::Name.unique.name }
  end

  trait :with_products do
    before(:build) do |tag|
      product = build(:product)
      tag.products << product
    end
  end
end
