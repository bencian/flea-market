FactoryBot.define do
  factory :slider do
    name { Faker::Name.name }
    after(:build) do |slider|
      slider.image.attach(
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
