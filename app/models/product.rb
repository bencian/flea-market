class Product < ApplicationRecord
  # -- Relations
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  # -- Validations


  # -- scopes
  scope :with_title, ->(name) { where('name like ?', "%#{name}%") }
  scope :with_category,->(category_id) { where('category_id = ?', category_id) }
end
