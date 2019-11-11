class Tag < ApplicationRecord
  # -- Relations
<<<<<<< HEAD
  has_and_belongs_to_many :products, dependent: :restrict_with_error, optional: true
=======
  has_and_belongs_to_many :products, optional: true
>>>>>>> 55afca700ab49e9237d0e45fcd085e00718e8009

  # -- Validations
  validates :name, presence: true, uniqueness: true

  # -- scopes
  scope :with_name, ->(name) { where('name like ?', "%#{name}%") }
end
