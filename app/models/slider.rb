class Slider < ApplicationRecord
  # -- Relations
  has_one_attached :image

  # -- Validations
  validate :has_image_attached

  def has_image_attached
    if image.attached?
      return
    end

    errors.add(:image, 'Debes subir una imagen')
  end
end
