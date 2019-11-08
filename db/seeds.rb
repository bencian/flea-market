require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Admin.create(username: 'admin', email: 'admin@snappler.com', password: '123123', password_confirmation: '123123')
10.times {
  Tag.create(name: Faker::Name.unique.name)
}

10.times {
  Category.create(name: Faker::Company.unique.bs)
}
frontend_config = FrontendConfiguration.new(singleton_guard: 0)
frontend_config.image.attach(
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
frontend_config.save

images_hash = {
  image1: 'images0.jpeg',
  image2: 'images1.jpeg',
  image3: 'images2.jpeg',
  image4: 'images3.jpeg',
  image5: 'images4.jpeg'
}

images_hash.each do |key, value|
  product = Product.new
  product.name = Faker::Name.unique.name
  product.description = Faker::Name.name
  product.code = Faker::Number.number(digits: 10)
  product.price = Faker::Number.decimal(l_digits: 2)
  product.cost = Faker::Number.decimal(l_digits: 2)
  product.category_id = Faker::Number.between(from: 0, to: 9)
  product_image = ProductImage.new
  product_image.primary = true
  product_image.image.attach(
    io: File.open(
      Rails.root.join(
        'public',
        'uploads',
        value
      )),
    filename: value,
    content_type: 'image/jpeg'
  )
  product.product_images << product_image
  product.save
end
