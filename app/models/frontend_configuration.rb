class FrontendConfiguration < ApplicationRecord
  # -- Relations
  has_one_attached :image

  # -- Validations
  validate :has_image_attached
  validates :singleton_guard, presence: true, uniqueness: true
  validate :only_one_instance

  def has_image_attached
    if image.attached?
      return
    end

    errors.add(:image, 'Debes subir una imagen')
  end

  def only_one_instance
    return if singleton_guard.zero?

    errors.add(:singleton_guard, 'No podes crear otra instancia, usa la existente')
  end

  def get_image
    image.attached? ? image : 'missing.png'
  end
end
