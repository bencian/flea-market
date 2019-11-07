FactoryBot.define do
  factory :product_image do
    primary { true }
    association :product
    after(:build) do |product_image|
      product_image.image.attach(
        io: File.open(
          Rails.root.join(
            'spec',
            'data',
            'images',
            'rspec.jpeg'
          )),
        filename: 'rspec.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
