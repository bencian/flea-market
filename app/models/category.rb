class Category < ApplicationRecord
  # -- Relations
  has_many :product

  # -- Validations
  validates :name, presence: true, uniqueness: true

  # -- scopes

  scope :with_name, ->(name) { where('name like ?', "%#{name}%")}
end
