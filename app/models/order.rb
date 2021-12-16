class Order < ApplicationRecord
  has_many :order_items
  before_save :set_subtotal
  belongs_to :users

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
