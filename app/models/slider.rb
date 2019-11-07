class Slider < ApplicationRecord
  # -- Relations
  has_one_attached :image

  # -- Validations
  validates :name, presence: true, uniqueness: true
  validate :has_image_attached

  # -- Scopes
  scope :with_name, ->(name) { where('name like ?', "%#{name}%") }

  def has_image_attached
    if image.attached?
      return
    end

    errors.add(:image, 'Debes subir una imagen')
  end
end
