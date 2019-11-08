class Category < ApplicationRecord
  # -- Relations
  has_many :product, dependent: :restrict_with_error

  # -- Validations
  validates :name, presence: true, uniqueness: true

  # -- scopes

  scope :with_name, ->(name) { where('name like ?', "%#{name}%")}
end
