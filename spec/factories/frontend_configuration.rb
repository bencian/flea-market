FactoryBot.define do
  factory :frontend_configuration do
    singleton_guard { 0 }
    after(:build) do |frontend_configuration|
      frontend_configuration.image.attach(
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
