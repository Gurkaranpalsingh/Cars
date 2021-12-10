class Manufacturer < ApplicationRecord
  has_many :car
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
