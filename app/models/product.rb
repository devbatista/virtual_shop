class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_items

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category, presence: true

  def in_stock?
    stock.positive?
  end
end
