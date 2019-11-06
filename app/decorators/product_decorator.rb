class ProductDecorator < ApplicationDecorator
  delegate_all

  def primary_image
    images = object.product_images.select do |i| 
      i.primary
    end
    images.first.image
  end
end
