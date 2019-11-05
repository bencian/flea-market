class Product < ApplicationRecord
  # -- Relations
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  # -- Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :code, 
            presence: true, 
            uniqueness: true, 
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }
  validates :price, numericality: true, allow_nil: true
  validates :cost, numericality: true, allow_nil: true
  validate :one_primary_image

  # -- Scopes
  scope :with_name, ->(name) { where('name like ?', "%#{name}%") }
  scope :with_category,->(category_id) { where('category_id = ?', category_id) }

  # -- Methods
  def one_primary_image
    result = product_images.select do |i|
      i.primary
    end
    return unless result.count != 1

    if result.count.zero?
      errors.add(:product_images, 'El producto no tiene imagen principal')
    else
      errors.add(:product_images, 'El producto tiene mas de una imagen principal')
    end
  end
end
