class Tag < ApplicationRecord
  # -- Relations
  has_and_belongs_to_many :products, optional: true

  # -- Validations
  validates :name, presence: true, uniqueness: true

  # -- scopes
  scope :with_name, ->(name) { where('name like ?', "%#{name}%") }
end
