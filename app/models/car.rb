class Car < ApplicationRecord
  has_one_attached :image
  belongs_to :manufacturer
  has_many :order_items
  QUANTITY = %w[1 2 3 4 5 6 7 8 9 10]
  validates :model, presence: true
  validates :model, length: { minimum: 2 }
  validates :description, length: { maximum: 1000, too_long: '%{count} characters is the maximum allowed' }
end
