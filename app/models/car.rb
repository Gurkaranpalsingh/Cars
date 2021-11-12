class Car < ApplicationRecord
  has_one_attached :image
  belongs_to :manufacturer
end
