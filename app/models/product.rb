class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  has_many :stock, class_name: "ProductStock", dependent: :destroy

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true

  def in_stock?
    stock.sum(:quantity).positive?
  end
end
