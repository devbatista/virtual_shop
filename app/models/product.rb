class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  has_many :stock, class_name: "ProductStock"

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true

  before_destroy :ensure_no_orders_or_stock
  before_destroy :clean_up_stock_before_destroy

  def in_stock?
    stock.sum(:quantity).positive?
  end

  private

    def ensure_no_orders_or_stock
      if order_items.exists?
        errors.add(:base, 'Cannot delete product with associated orders')
        throw(:abort)
      end

      if in_stock?
        errors.add(:base, 'Cannot delete product with stock')
        throw(:abort)
      end
    end

    def clean_up_stock_before_destroy
      stock.destroy_all if stock.any?
    end
end
